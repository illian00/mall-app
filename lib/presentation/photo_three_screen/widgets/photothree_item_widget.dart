import 'package:flutter/material.dart';
import 'package:mally/core/app_export.dart';

// ignore: must_be_immutable
class PhotothreeItemWidget extends StatelessWidget {
  PhotothreeItemWidget({
    Key? key,
    this.onTapFrameSix,
  }) : super(
          key: key,
        );

  VoidCallback? onTapFrameSix;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFrameSix!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 44.h,
          vertical: 59.v,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder15,
        ),
        child: Text(
          "Food",
          style: theme.textTheme.headlineLarge,
        ),
      ),
    );
  }
}
