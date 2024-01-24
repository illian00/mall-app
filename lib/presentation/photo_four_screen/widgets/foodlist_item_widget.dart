import 'package:flutter/material.dart';
import 'package:mally/core/app_export.dart';

// ignore: must_be_immutable
class FoodlistItemWidget extends StatelessWidget {
  const FoodlistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgFrame63,
            height: 88.adaptSize,
            width: 88.adaptSize,
            radius: BorderRadius.circular(
              15.h,
            ),
          ),
          Container(
            width: 66.adaptSize,
            margin: EdgeInsets.only(
              left: 22.h,
              bottom: 21.v,
            ),
            child: Text(
              "Bahandi \n-\nFood",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyLarge!.copyWith(
                height: 1.38,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
