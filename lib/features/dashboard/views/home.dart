import 'dart:ffi';

import 'package:dartcoder/main.dart';
import 'package:dartcoder/shared/app_string.dart';
import 'package:dartcoder/shared/assets.dart';
import 'package:dartcoder/shared/constants.dart';
import 'package:dartcoder/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.onCourseTap});
  final VoidCallback? onCourseTap;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.dashboard),
        actions: [
          PopupMenuButton(
            initialValue: null,
            onSelected: (v) {
              if (v == "theme") {
                isDarkTheme.value = !isDarkTheme.value;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                  value: "theme",
                  child: ValueListenableBuilder(
                      valueListenable: isDarkTheme,
                      builder: (_, isDark, __) {
                        return Row(
                          children: [
                            Icon(
                              isDark ? Icons.sunny : Icons.dark_mode,
                              color: isDark ? AppColors.white : AppColors.black,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 3.0),
                              child: Text("Theme"),
                            ),
                          ],
                        );
                      })),
            ],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                Icons.settings_outlined,
                size: 20.sp,
              ),
            ),
          ),
          SizedBox(width: 20.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              dashboardCard(onTap: widget.onCourseTap),
              SizedBox(height: 20.h),
              dashboardCard(
                  image: Assets.images.dsa,
                  title: AppString.dsaCourse,
                  desc: AppString.learnDsa,
                  onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget dashboardCard(
      {String title = AppString.dartCourse,
      String desc = AppString.learnTheBasics,
      VoidCallback? onTap,
      AppAssetImage? image}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      height: 200.h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: (image ?? Assets.images.dart).image(
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.h,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              gradient: LinearGradient(
                stops: const [0.02, 1, 1],
                colors: [
                  Theme.of(context).secondaryHeaderColor.withValues(alpha: .5),
                  Theme.of(context).secondaryHeaderColor.withValues(alpha: 1),
                  Theme.of(context).secondaryHeaderColor.withValues(alpha: 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 5.h),
                Text(
                  desc,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                ),
                SizedBox(height: 10.h),
                AppButton(
                  text: AppString.start,
                  onTap: onTap,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
