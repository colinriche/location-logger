import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geofence_service/geofence_service.dart'
as GFS; // Import Geofence from the package with a prefix
import 'package:geofence_service/models/geofence_radius.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://exyqyhptzagxajahvmjr.supabase.co',
    anonKey:
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV4eXF5aHB0emFneGFqYWh2bWpyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODU1NDEwNDQsImV4cCI6MjAwMTExNzA0NH0._8Vm5eg8tGTT2NwSlvcqumbM5TGrwYxCXLq_AM7pAhk',
  );

  List<MyGeofence> geofenceList = await fetchGeofenceList();
  await FlutterBackground.initialize();

  // Initialize the service
  await initializeService(geofenceList);

  runApp(
    MaterialApp(
      home: MyApp(geofenceList),
    ),
  );
}

const notificationChannelId = 'my_foreground';
const notificationId = 888;

class GeofenceService {
  GFS.GeofenceService? _instance;

  GeofenceService._privateConstructor();

  static final GeofenceService _instanceService =
  GeofenceService._privateConstructor();

  factory GeofenceService() {
    return _instanceService;
  }

  GFS.GeofenceService get instance {
    _instance ??= GFS.GeofenceService.instance.setup(
      interval: 2000,
      accuracy: 200,
      loiteringDelayMs: 40000,
      statusChangeDelayMs: 10000,
      useActivityRecognition: true,
      allowMockLocations: false,
      printDevLog: true,
      geofenceRadiusSortType: GFS.GeofenceRadiusSortType.DESC,
    );
    return _instance!;
  }
}

Future<void> initializeService(List<MyGeofence> geofenceList) async {
  final service = FlutterBackgroundService();

  /// OPTIONAL, using a custom notification channel id
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'my_foreground', // id
    'MY FOREGROUND SERVICE', // title
    description: 'This channel is used for important notifications.', // description
    importance: Importance.low, // importance must be at low or higher level
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  if (Platform.isIOS || Platform.isAndroid) {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        iOS: DarwinInitializationSettings(),
        android: AndroidInitializationSettings('ic_bg_service_small'),
      ),
    );
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will be executed when the app is in the foreground or background in a separate isolate
      onStart: onStart,

      // auto start service
      autoStart: true,
      isForegroundMode: true,

      notificationChannelId: 'my_foreground',
      initialNotificationTitle: 'AWESOME SERVICE',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: true,

      // this will be executed when the app is in the foreground in a separate isolate
      onForeground: onStart,

      // you have to enable background fetch capability on Xcode project
    ),
  );

  service.startService();
  final geofenceService = GeofenceService().instance;

  geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
  geofenceService.addLocationChangeListener(_onLocationChanged);
  geofenceService.addActivityChangeListener(_onActivityChanged);
  geofenceService
      .addLocationServicesStatusChangeListener(_onLocationServicesStatusChanged);

  geofenceService.start(
    geofenceList.map((myGeofence) {
      return GFS.Geofence(
        id: myGeofence.id,
        latitude: myGeofence.latitude,
        longitude: myGeofence.longitude,
        radius: [
          GFS.GeofenceRadius(
            id: myGeofence.radius.id,
            length: myGeofence.radius.length,
          ),
        ],
      );
    }).toList(),
  );
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Only available for Flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();

  // For Flutter prior to version 3.0.0
  // We have to register the plugin manually

  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString("hello", "world");

  /// OPTIONAL when using a custom notification
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  // bring to foreground
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        /// OPTIONAL for use custom notification
        /// the notification id must be equals with AndroidConfiguration when you call configure() method.
        flutterLocalNotificationsPlugin.show(
          888,
          'COOL SERVICE',
          'Awesome ${DateTime.now()}',
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'my_foreground',
              'MY FOREGROUND SERVICE',
              icon: 'ic_bg_service_small',
              ongoing: true,
            ),
          ),
        );

        // if you don't use custom notification, uncomment this
        service.setForegroundNotificationInfo(
          title: "My App Service",
          content: "Updated at ${DateTime.now()}",
        );
      }
    }

    /// you can see this log in logcat
    print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

    // test using an external plugin
    final deviceInfo = DeviceInfoPlugin();
    String? device;
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      device = androidInfo.model;
    }

    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      device = iosInfo.model;
    }

    service.invoke(
      'update',
      {
        "current_date": DateTime.now().toIso8601String(),
        "device": device,
      },
    );
  });
}

Future<List<MyGeofence>> fetchGeofenceList() async {
  try {
    final response = await Supabase.instance.client
        .from('places')
        .select('name, latitude, longitude, radius_id, radius')
        .execute();

    final geofenceData = response.data;
    List<MyGeofence> geofenceList = [];

    for (var data in geofenceData) {
      final geofence = MyGeofence(
        id: data['name'].toString(),
        latitude: data['latitude'],
        longitude: data['longitude'],
        radius: GeofenceRadius(
          id: data['radius_id'].toString(),
          length: double.parse(data['radius'].toString())
        ),
      );
      geofenceList.add(geofence);
    }

    return geofenceList;
  } catch (e) {
    print('Error fetching geofence list: $e');
    return []; // Return an empty list in case of an error
  }
}







class MyApp extends StatelessWidget {
  final List<MyGeofence> geofenceList;

  MyApp(this.geofenceList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geofence Notifications'),
      ),
      body: ListView.builder(
        itemCount: geofenceList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(geofenceList[index].id),
            subtitle: Text(
              'Latitude: ${geofenceList[index].latitude}, Longitude: ${geofenceList[index].longitude}, Radius: ${geofenceList[index].radius.length}',
            ),
          );
        },
      ),
    );
  }
}

class GeofenceRadius {
  final String id;
  final double length;

  GeofenceRadius({
    required this.id,
    required this.length,
  });

  factory GeofenceRadius.fromJson(Map<String, dynamic> json) {
    return GeofenceRadius(
      id: json['id'],
      length: json['length'],
    );
  }
}

class MyGeofence {
  final String id;
  final double latitude;
  final double longitude;
  final GeofenceRadius radius;

  MyGeofence({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.radius,
  });

  factory MyGeofence.fromJson(Map<String, dynamic> json) {
    return MyGeofence(
      id: json['id'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      radius: GeofenceRadius.fromJson(json['radius']),
    );
  }
}

// This function is to be called when the geofence status is changed.
Future<void> _onGeofenceStatusChanged(GFS.Geofence geofence,
    GFS.GeofenceRadius geofenceRadius, GFS.GeofenceStatus geofenceStatus, GFS.Location location) async {
  print('geofence: ${geofence.toJson()}');
  print('geofenceRadius: ${geofenceRadius.toJson()}');
  print('geofenceStatus: ${geofenceStatus.toString()}');
  try {
    final now = DateTime.now();
    final response = await Supabase.instance.client.from('logs').insert([
      {
        'name': geofence.id,
        'latitude': geofence.latitude,
        'longitude': geofence.longitude,
        'status': geofenceStatus.toString(),
        'updateTime': now.toUtc().toIso8601String(),
      }
    ]).execute();

    print('Data inserted successfully');
  } catch (e) {
    print('Error inserting data: $e');
  }
}

// This function is to be called when the activity has changed.
void _onActivityChanged(GFS.Activity prevActivity, GFS.Activity currActivity) {
  print('prevActivity: ${prevActivity.toJson()}');
  print('currActivity: ${currActivity.toJson()}');
}

// This function is to be called when the location has changed.
void _onLocationChanged(GFS.Location location) {
  print('location: ${location.toJson()}');
}

// This function is to be called when a location services status change occurs
// since the service was started.
void _onLocationServicesStatusChanged(bool status) {
  print('isLocationServicesEnabled: $status');
}

// This function is used to handle errors that occur in the service.
void _onError(dynamic error) {
  print('Error: $error');
}
