import 'dart:typed_data';

// These are converted to acceptable format by Chopper Api (default)

Uint8List uint8ListFromJson(Map<String, dynamic> json) =>
    Uint8List.fromList(List<int>.from(json['data']));

Map<String, dynamic> uint8ListToJson(Uint8List data) =>
    {'type': 'Buffer', 'data': data};

List<Uint8List> uint8ListListFromJson(List<dynamic> json) =>
    json.map((e) => uint8ListFromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>> uint8ListListToJson(List<Uint8List> data) =>
    data.map((e) => uint8ListToJson(e)).toList();

// Websocket JSON serialization

Uint8List uint8ListFromJsonWs(dynamic json) {
  if (json is Map<String, dynamic> &&
      json['type'] == 'Buffer' &&
      json['data'] is List) {
    return Uint8List.fromList(List<int>.from(json['data']));
  } else if (json is List<int>) {
    return Uint8List.fromList(json);
  }
  throw Exception('Invalid Buffer format');
}

Map<String, dynamic> uint8ListToJsonWs(Uint8List data) {
  return {
    'type': 'Buffer',
    'data': data.toList(),
  };
}
