import 'package:dartcoder/features/authetication/views/onboarding_screen.dart';
import 'package:dartcoder/features/dashboard/views/dashboard_screen.dart';
import 'package:dartcoder/features/dashboard/views/home.dart';
import 'package:dartcoder/features/editor/views/editor_screen.dart';
import 'package:dartcoder/views/course_details.dart';
import 'package:flutter/cupertino.dart';

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

      default:
        return CupertinoPageRoute(builder: (_) => const OnboardingScreen());
    }
  }

  static const String onboarding = "/";
  static const String dashboard = "/dashboard";
  static const String courseDetails = "/courseDetails";
  static const String editor = "/editor";

  static Future push(String routeName, {Object? arg}) async =>
      await navKey.currentState?.pushNamed(routeName, arguments: arg);

  static void pop({Object? arg}) async => navKey.currentState?.pop(arg);
}
