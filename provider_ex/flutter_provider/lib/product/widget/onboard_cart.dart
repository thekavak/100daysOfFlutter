import 'package:flutter/material.dart';

import 'package:flutter_provider/feature/onboard/onboard_model.dart';

class OnBoardCard extends StatelessWidget {
  const OnBoardCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(model.title, style: Theme.of(context).textTheme.headline4),
        const SizedBox(
          height: 10,
        ),
        Text(
          model.description,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.grey, fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        Image.asset(model.imageWithPath)
      ],
    );
  }
}
