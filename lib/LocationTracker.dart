import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class LocationTracker {
  final Geolocator _geolocator = Geolocator();
  Position? _currentPosition;
  StreamSubscription<Position>? _positionStreamSubscription;
  ValueNotifier<Position?> _positionNotifier = ValueNotifier<Position?>(null);

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
    _positionNotifier.value = position;
    print('Location Update: Latitude: ${position.latitude}, Longitude: ${position.longitude}');
  }

  // Check if location tracking is currently active
  bool isTracking() {
    return _positionStreamSubscription != null;
  }

  // Get the position notifier
  ValueNotifier<Position?> getPositionNotifier() {
    return _positionNotifier;
  }
}
