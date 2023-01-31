import 'package:citytech/res/app_colors.dart';
import 'package:citytech/ui/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstTabBar extends StatefulWidget {
  final List<String> tabItems;

  const FirstTabBar({
    super.key,
    required this.tabItems,
    required this.tabViews,
  });

  final List<Widget> tabViews;

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<FirstTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTab(widget.tabItems[0], 0),
              _buildTab(widget.tabItems[1], 1),
            ],
          ),
        ),
        UiHelper.verticalSpacing(17.h),
        SizedBox(
          child: widget.tabViews[_selectedIndex],
        ),
      ],
    );
  }

  InkWell _buildTab(String tabItem, index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 40.h,
        width: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: _selectedIndex == index
              ? AppColors.primaryGreen
              : AppColors.transparent,
          border: Border.all(color: AppColors.primaryGreen),
        ),
        child: Center(
          child: Text(
            tabItem,
            style: TextStyle(
              color: _selectedIndex == index
                  ? AppColors.white
                  : AppColors.primaryGreen,
            ),
          ),
        ),
      ),
    );
  }
}
