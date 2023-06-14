import 'dart:convert';

HomeCardModel homeCardModelFromJson(String str) =>
    HomeCardModel.fromJson(json.decode(str));

String homeCardModelToJson(HomeCardModel data) => json.encode(data.toJson());

class HomeCardModel {
  Data data;

  HomeCardModel({
    required this.data,
  });

  factory HomeCardModel.fromJson(Map<String, dynamic> json) => HomeCardModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<YogaType> yogaTypes;

  Data({
    required this.yogaTypes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        yogaTypes: List<YogaType>.from(
            json["yoga_types"].map((x) => YogaType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "yoga_types": List<dynamic>.from(yogaTypes.map((x) => x.toJson())),
      };
}

class YogaType {
  String name;
  String image;

  YogaType({
    required this.name,
    required this.image,
  });

  factory YogaType.fromJson(Map<String, dynamic> json) => YogaType(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
