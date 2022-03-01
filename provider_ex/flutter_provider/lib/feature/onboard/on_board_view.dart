import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_provider/feature/onboard/onboard_model.dart';
import 'package:flutter_provider/feature/onboard/tab_indicator.dart';
import 'package:flutter_provider/product/padding/page_padding.dart';
import 'package:flutter_provider/product/widget/onboard_cart.dart';

part './module/start_tab_button.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _skipTitle = 'Skip';

  int _selectedIndex = 0;

  bool get _isLastPage =>
      OnBoardModels.onBoardItems.length - 1 == _selectedIndex;
  bool get _isFirstPage => 0 == _selectedIndex;

/*
  *****xxxxx***
 */

  ValueNotifier<bool> isBackEnable = ValueNotifier(false);

  void _incrementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      _changeBackEnable(true);
      return;
    }

    _changeBackEnable(false);

    setState(() {
      if (value != null) {
        _selectedIndex = value;
      } else {
        _selectedIndex++;
      }
    });
  }

  void _changeBackEnable(bool value) {
    isBackEnable.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
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
                _StartTabButton(
                    isLastPage: _isLastPage, onPressed: _incrementAndChange),
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [
        ValueListenableBuilder<bool>(
            valueListenable: isBackEnable,
            builder: (BuildContext context, bool value, Widget? child) {
              return value
                  ? const SizedBox()
                  : TextButton(onPressed: null, child: Text(_skipTitle));
            })
      ],
      leading: !_isFirstPage
          ? IconButton(
              onPressed: _incrementAndChange,
              icon: const Icon(
                Icons.chevron_left_outlined,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }

  PageView _pageViewItems() {
    return PageView.builder(
        onPageChanged: (value) => _incrementAndChange(value),
        itemCount: OnBoardModels.onBoardItems.length,
        itemBuilder: (context, index) {
          return OnBoardCard(model: OnBoardModels.onBoardItems[index]);
        });
  }
}
