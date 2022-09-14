import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_example/core/padding/page_padding.dart';
import 'package:flutter_bloc_example/core/shared/ui_text.dart';
import 'package:flutter_bloc_example/feature/onboard/on_board_model.dart';
import 'package:flutter_bloc_example/feature/onboard/widget/onboard_card.dart';
import 'package:flutter_bloc_example/feature/onboard/widget/tab_indicator.dart';

//Kullaniciya gosterilen kaydirmali sayfanin ayarlari

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  int _selectedIndex = 0;

//sayfa sayisini secili sayfa icin kontrol etme
//_selectedIndex OnBoardModels.onBoardItems.length - 1 esit ise son
  bool get _isLastPage =>
      OnBoardModels.onBoardItems.length - 1 == _selectedIndex;

//next e basinca tetiklenen FloatingActionButton ile sayfanin sol altındaki
//TabPageSelector degismesi icin gerekli fonksiyonlar

  void incrementAndChange() {
    if (_isLastPage) {
      return;
    }

    incrementSelectedPage();
  }

  void incrementSelectedPage() {
    setState(() {
      _selectedIndex++;
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
                _nextButton(),
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
      leading: IconButton(
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
      itemCount: OnBoardModels.onBoardItems.length,
      itemBuilder: (context, index) {
        return OnboardCard(model: OnBoardModels.onBoardItems[index]);
      },
    );
  }

  FloatingActionButton _nextButton() {
    return FloatingActionButton(
      onPressed: () {
        incrementAndChange();
      },
      child: const Text(UIText.nextButton),
    );
  }
}
