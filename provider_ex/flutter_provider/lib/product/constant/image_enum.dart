import 'package:flutter/material.dart';

enum ImageEnums { door }

extension ImageExtension on ImageEnums {
  String toPath() {
    return 'asset/images/ic_$name.png';
  }

  Image get toImage => Image.asset(toPath());
}
