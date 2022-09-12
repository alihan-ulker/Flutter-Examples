import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_example/core/padding/page_padding.dart';
import 'package:flutter_bloc_example/core/shared/ui_text.dart';
import 'package:flutter_bloc_example/feature/onboard/on_board_model.dart';
import 'package:flutter_bloc_example/feature/onboard/widget/onboard_card.dart';

//Kullaniciya gosterilen kaydirmali sayfanin ayarlari

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: OnBoardModels.onBoardItems.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
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
                TabPageSelector(
                  controller: _tabController,
                ),
                _nextButton(),
              ],
            ),
          ],
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
      onPressed: () {},
      child: const Text(UIText.nextButton),
    );
  }
}
