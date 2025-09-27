import 'package:dartcoder/features/authetication/views/onboarding_screen.dart';
import 'package:dartcoder/features/courses/views/course_quiz.dart';
import 'package:dartcoder/features/dashboard/views/dashboard_screen.dart';
import 'package:dartcoder/features/dashboard/views/home.dart';
import 'package:dartcoder/features/editor/views/editor_screen.dart';
import 'package:dartcoder/shared/theme.dart';
import 'package:dartcoder/features/courses/views/course_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRouter {
  static final navKey = GlobalKey<NavigatorState>();

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return CupertinoPageRoute(builder: (_) => const OnboardingScreen());

      case dashboard:
        return CupertinoPageRoute(builder: (_) => const DashboardScreen());
      case courseDetails:
        return CupertinoPageRoute(
            builder: (_) =>
                CourseDetails(arg: settings.arguments as CourseDetailsArgs?));
      case editor:
        return CupertinoPageRoute(builder: (_) => const Editor());
      case quiz:
        return CupertinoPageRoute(
            builder: (_) =>
                CourseQuiz(arg: settings.arguments as CourseQuizArg?));

      default:
        return CupertinoPageRoute(builder: (_) => const OnboardingScreen());
    }
  }

  static const String onboarding = "/";
  static const String dashboard = "/dashboard";
  static const String courseDetails = "/courseDetails";
  static const String editor = "/editor";
  static const String quiz = "/quiz";

  static Future push(String routeName, {Object? arg}) async =>
      await navKey.currentState?.pushNamed(routeName, arguments: arg);

  static void pop({Object? arg}) async => navKey.currentState?.pop(arg);
  static void pushAndClear(String routeName, {Object? arg}) async => navKey
      .currentState
      ?.pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arg);

  static void showMessage(String message) {
    ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(SnackBar(
      elevation: 0,
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(8)),
              child: Text(message,
                  style: Theme.of(navKey.currentContext!)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white)),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
      clipBehavior: Clip.antiAlias,
      behavior: SnackBarBehavior.floating,
    ));
  }
}
