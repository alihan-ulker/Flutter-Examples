import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'regres_model.g.dart';
//flutter pub run build_runner watch
//https://pub.dev/packages/build_runner

@JsonSerializable()
class RegresModel extends INetworkModel<RegresModel> {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;

  RegresModel(
      {this.page, this.perPage, this.total, this.totalPages, this.data});

  factory RegresModel.fromJson(Map<String, dynamic> json) {
    return _$RegresModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$RegresModelToJson(this);
  }

  @override
  RegresModel fromJson(Map<String, dynamic> json) {
    return _$RegresModelFromJson(json);
  }
}

@JsonSerializable()
class Data extends INetworkModel<Data> {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }

  @override
  Data fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
}
