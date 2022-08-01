class NounError {
  NounError({this.statusCode, this.message});

  NounError.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'] as int;
    message = json['message'] as String;
  }
  int? statusCode;
  String? message;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    return data;
  }
}
