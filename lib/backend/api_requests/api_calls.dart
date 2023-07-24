import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LocationsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'locations',
      apiUrl: 'https://exyqyhptzagxajahvmjr.supabase.co',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV4eXF5aHB0emFneGFqYWh2bWpyIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NTU0MTA0NCwiZXhwIjoyMDAxMTE3MDQ0fQ.5dPnQuegyQN87w2mXUeMF9TrcDlzwl74GqqPrjBn4QY',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GeoCodingCall {
  static Future<ApiCallResponse> call({
    String? latlang = '52.02650263828185, -0.7380820405210613',
    String? key = 'AIzaSyCgoDmUJj6Lo8OLftHP0dmsGhlJmlzknUo',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GeoCoding',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latlang}&key=${key}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
