import 'package:flutter/material.dart';

class KencanModel {
  String? name;
  String? image;
  String? subTitle;
  String? subTitle1;
  bool? mISCheck;
  Widget? widget;
  Color? color;
  int? age;
  String? education;

  KencanModel(
      {this.name,
      this.image,
      this.subTitle,
      this.subTitle1,
      this.mISCheck = false,
      this.widget,
      this.color,
      this.age,
      this.education});
}
