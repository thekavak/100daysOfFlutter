import 'package:flutter/material.dart';

class CenterDataText extends StatefulWidget {
  CenterDataText({Key? key, required this.text, required this.number})
      : super(key: key);
  final String? text;
  final int? number;
  @override
  State<CenterDataText> createState() => _CenterDataTextState();
}

class _CenterDataTextState extends State<CenterDataText> {
  bool value = false;
  @override
  void didUpdateWidget(CenterDataText oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
    if (oldWidget.number != widget.number) {
      value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      widget.text ?? '',
      style: TextStyle(color: value == false ? Colors.cyan : Colors.redAccent),
    ));
  }
}
