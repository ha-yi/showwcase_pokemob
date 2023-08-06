import 'package:showwcase_pokemob/model/base.model.dart';

typedef ResponseBuilder<T extends BaseJsonModel> = T Function(Map<String, dynamic> data);

class ApiResponse<T extends BaseJsonModel> {
  int? count;
  String? next;
  String? previous;
  List<T>? results;

  ApiResponse({this.count, this.next, this.previous, this.results});

  ApiResponse.fromJson(Map<String, dynamic> json, ResponseBuilder<T> builder, {bool isList = true}) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null && isList) {
      results = <T>[];
      json['results'].forEach((v) {
        results!.add(builder.call(v));
      });
    }
    if (json['results'] != null && !isList) {
      results = [builder.call(json['results'])];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
