import 'package:citytech/res/app_colors.dart';
import 'package:citytech/ui/home/model/tickets.dart';
import 'package:citytech/ui/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatefulWidget {
  final List<String> tabItems;

  const CustomTabBar({
    super.key,
    required this.tabItems,
    required this.tabViews,
  });

  final List<Widget> tabViews;

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
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
              _buildTab(widget.tabItems[2], 2),
              _buildTab(widget.tabItems[3], 3)
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

  SizedBox _buildGridView(Tickets tickets) {
    return SizedBox(
      height: 700.h,
      width: 300.w,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2.7,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryGreen),
                borderRadius: BorderRadius.circular(20.r)),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.hourglass_bottom,
                  size: 18,
                ),
                tickets == null
                    ? const CircularProgressIndicator()
                    : Column(
                        children: [
                          Text(
                            tickets!.data!.dist!.month![index].label ??
                                "No Data",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          Text(
                            tickets!.data!.dist!.month![index].value ??
                                "No Data",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
