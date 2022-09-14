// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_bloc_example/feature/onboard/on_board_model.dart';

class TabIndicator extends StatefulWidget {
  const TabIndicator({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  final int selectedIndex;

  @override
  TabIndicatorState createState() => TabIndicatorState();
}

class TabIndicatorState extends State<TabIndicator>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

//TabController da sayfa noktalarinin kaymasi icin
//onboard view de olan veriyi gunceller
//didUpdateWidget widget yapilandirmasi her degistiginde cagrilir.
//guncelleme saglar
  @override
  void didUpdateWidget(covariant TabIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _tabController.animateTo(widget.selectedIndex);
    }
  }

//TabController uzunlugunu onboardItems uzunluguna esitlemek icin
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: OnBoardModels.onBoardItems.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      controller: _tabController,
    );
  }
}
