import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_example/core/padding/page_padding.dart';
import 'package:flutter_bloc_example/core/shared/ui_text.dart';
import 'package:flutter_bloc_example/feature/onboard/on_board_model.dart';
import 'package:flutter_bloc_example/feature/onboard/widget/onboard_card.dart';
import 'package:flutter_bloc_example/feature/onboard/widget/tab_indicator.dart';

part './module/start_fab_button.dart';

//Kullaniciya gosterilen kaydirmali sayfanin ayarlari

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  int _selectedIndex = 0;

//sayfa sayisini secili sayfa icin kontrol etme
//_selectedIndex OnBoardModels.onBoardItems.length - 1 esit ise son sayfa
  bool get _isLastPage =>
      OnBoardModels.onBoardItems.length - 1 == _selectedIndex;

//_selectedIndex 0 a esitse ilk sayfa
  bool get _isFirstPage => _selectedIndex == 0;

//next e basinca tetiklenen FloatingActionButton ile sayfanin sol altındaki
//TabPageSelector degismesi icin gerekli fonksiyonlar

  void _incrementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      return;
    }

    _incrementSelectedPage(value);
  }

//eger value degeri gelirse veriyi set et
  void _incrementSelectedPage([int? value]) {
    //inspect(this) ile tum sayfada olan degisiklikler loglanir.
    inspect(this);
    setState(() {
      _selectedIndex = value ?? _selectedIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const PagePadding.all(),
        child: Column(
          children: [
            Expanded(
              child: _pageViewItems(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabIndicator(
                  selectedIndex: _selectedIndex,
                ),
                _StartFabButton(
                  isLastPage: _isLastPage,
                  onPressed: () {
                    _incrementAndChange();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      //koyu sistem appbar i icin
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [
        TextButton(onPressed: () {}, child: const Text(UIText.skipTitle)),
      ],
      leading: _isFirstPage
          ? null
          : IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chevron_left_outlined,
                color: Colors.grey,
              ),
            ),
    );
  }

  PageView _pageViewItems() {
    return PageView.builder(
      onPageChanged: (value) {
        _incrementAndChange(value);
      },
      itemCount: OnBoardModels.onBoardItems.length,
      itemBuilder: (context, index) {
        return OnboardCard(model: OnBoardModels.onBoardItems[index]);
      },
    );
  }

  // FloatingActionButton _nextButton() {
  //   return FloatingActionButton(
  //     onPressed: () {
  //       _incrementAndChange();
  //     },
  //     child: Text(_isLastPage ? UIText.start : UIText.nextButton),
  //   );
  // }
}
