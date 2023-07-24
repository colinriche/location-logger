import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Operator = prefs.getStringList('ff_Operator') ?? _Operator;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  Color _one = Color(4294967295);
  Color get one => _one;
  set one(Color _value) {
    _one = _value;
  }

  Color _two = Color(4278650856);
  Color get two => _two;
  set two(Color _value) {
    _two = _value;
  }

  Color _three = Color(4285591353);
  Color get three => _three;
  set three(Color _value) {
    _three = _value;
  }

  List<String> _Operator = [
    'ParkingEye',
    'Civil Enforcement',
    'Euro Car Parks',
    'Highview Parking',
    'Horizon',
    'MET Parking',
    'Napier',
    'NCP',
    'Park Maven',
    'Parkonomy',
    'Premier Park',
    'Smart Parking',
    'UKPC',
    'Britannia',
    'Countrywide',
    'G24',
    'Group Nexus',
    '1',
    '2',
    '3',
    '4',
    '5'
  ];
  List<String> get Operator => _Operator;
  set Operator(List<String> _value) {
    _Operator = _value;
    prefs.setStringList('ff_Operator', _value);
  }

  void addToOperator(String _value) {
    _Operator.add(_value);
    prefs.setStringList('ff_Operator', _Operator);
  }

  void removeFromOperator(String _value) {
    _Operator.remove(_value);
    prefs.setStringList('ff_Operator', _Operator);
  }

  void removeAtIndexFromOperator(int _index) {
    _Operator.removeAt(_index);
    prefs.setStringList('ff_Operator', _Operator);
  }

  void updateOperatorAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _Operator[_index] = updateFn(_Operator[_index]);
    prefs.setStringList('ff_Operator', _Operator);
  }

  LatLng? _selectLocation = LatLng(2, 2);
  LatLng? get selectLocation => _selectLocation;
  set selectLocation(LatLng? _value) {
    _selectLocation = _value;
  }

  bool _withGPS = true;
  bool get withGPS => _withGPS;
  set withGPS(bool _value) {
    _withGPS = _value;
  }

  String _locationResultCallback = '';
  String get locationResultCallback => _locationResultCallback;
  set locationResultCallback(String _value) {
    _locationResultCallback = _value;
  }

  LatLng? _singleLatLong = LatLng(55.953252, -3.188267);
  LatLng? get singleLatLong => _singleLatLong;
  set singleLatLong(LatLng? _value) {
    _singleLatLong = _value;
  }

  List<bool> _msgInOut = [];
  List<bool> get msgInOut => _msgInOut;
  set msgInOut(List<bool> _value) {
    _msgInOut = _value;
  }

  void addToMsgInOut(bool _value) {
    _msgInOut.add(_value);
  }

  void removeFromMsgInOut(bool _value) {
    _msgInOut.remove(_value);
  }

  void removeAtIndexFromMsgInOut(int _index) {
    _msgInOut.removeAt(_index);
  }

  void updateMsgInOutAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _msgInOut[_index] = updateFn(_msgInOut[_index]);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
