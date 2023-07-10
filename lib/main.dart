import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationTracker {
  final Geolocator _geolocator = Geolocator();
  Position? _currentPosition;
  StreamSubscription<Position>? _positionStreamSubscription;

  // Start tracking the user's location
  void startLocationTracking() {
    // Set up location options (adjust as needed)
    final locationOptions = LocationOptions(accuracy: LocationAccuracy.best, distanceFilter: 10);

    // Start listening for location updates
    _positionStreamSubscription = Geolocator.getPositionStream().listen(
          (Position position) {
        _currentPosition = position;

        // Call your desired method for handling the location update
        handleLocationUpdate(position);
      },
      onError: (error) {
        print('Location update error: $error');
      },
    );
  }

  // Stop tracking the user's location
  void stopLocationTracking() {
    _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
  }

  // Handle the location update
  void handleLocationUpdate(Position position) {
    // Do any necessary processing with the location update
    print('Location Update: Latitude: ${position.latitude}, Longitude: ${position.longitude}');
  }

  // Check if location tracking is currently active
  bool isTracking() {
    return _positionStreamSubscription != null;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LocationTracker _locationTracker = LocationTracker();

  @override
  void initState() {
    super.initState();
    // Start location tracking when the app is initialized
    _locationTracker.startLocationTracking();
  }

  @override
  void dispose() {
    // Stop location tracking when the app is disposed
    _locationTracker.stopLocationTracking();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Location Tracker'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Start or stop location tracking based on the current state
              if (_locationTracker.isTracking()) {
                _locationTracker.stopLocationTracking();
              } else {
                _locationTracker.startLocationTracking();
              }
              setState(() {}); // Update the UI
            },
            child: Text(_locationTracker.isTracking() ? 'Stop Tracking' : 'Start Tracking'),
          ),
        ),
      ),
    );
  }
}
