import 'package:flutter/rendering.dart';

//Tum sayfalarda ayni padding kullanabilmek icin

class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(30);
  const PagePadding.allLow() : super.all(15);
}
