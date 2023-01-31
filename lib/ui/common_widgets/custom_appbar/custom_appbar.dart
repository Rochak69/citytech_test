import 'package:citytech/res/app_colors.dart';
import 'package:citytech/ui/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar(
      {super.key, this.actionWidget, this.title, this.isCenterTile = false});
  final Widget? actionWidget;
  final String? title;
  final bool isCenterTile;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primaryGreen,
        elevation: 0,
        centerTitle: isCenterTile,
        title: Padding(
          padding: EdgeInsets.only(left: isCenterTile ? 0 : 12.w),
          child: title != null
              ? Text(
                  title!,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryGreen),
                )
              : Container(),
        ),
        actions: [
          actionWidget ?? Container(),
          UiHelper.horizontalSpacing(25.w)
        ]);
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
