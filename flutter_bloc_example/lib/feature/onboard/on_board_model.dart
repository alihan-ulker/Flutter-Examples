import 'package:flutter_bloc_example/core/shared/ui_text.dart';

//on board sayfasinda ki gorseller icin tek tek
//image adresi ve tanimlamalar yapmamak icin

class OnBoardModel {
  final String title;
  final String description;
  final String imageName;

  OnBoardModel(this.title, this.description, this.imageName);

  String get imageWithPath => "assets/images/$imageName.png";
}

class OnBoardModels {
  static final List<OnBoardModel> onBoardItems = [
    OnBoardModel(UIText.orderTitle, UIText.orderSubtitle, "ic_chef"),
    OnBoardModel(UIText.orderTitle, UIText.orderSubtitle, "ic_delivery"),
    OnBoardModel(UIText.orderTitle, UIText.orderSubtitle, "ic_order"),
  ];
}
