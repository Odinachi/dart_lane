import 'package:dartcoder/features/authetication/views/onboarding_screen.dart';
import 'package:dartcoder/features/dashboard/views/dashboard_screen.dart';
import 'package:dartcoder/views/home.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static final navKey = GlobalKey<NavigatorState>();

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return CupertinoPageRoute(builder: (_) => const OnboardingScreen());

      default:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
    }
  }

  static const String courseDetails = "/course_details";
  static const String onboarding = "/";
  static const String editor = "/editor";

  static Future push(String routeName, {Object? arg}) async =>
      await navKey.currentState?.pushNamed(routeName, arguments: arg);

  static void pop({Object? arg}) async => navKey.currentState?.pop(arg);
}
