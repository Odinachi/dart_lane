import 'package:dartcoder/views/course_details.dart';
import 'package:dartcoder/views/dart_coder.dart';
import 'package:dartcoder/views/home.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static final navKey = GlobalKey<NavigatorState>();

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case courseDetails:
        return CupertinoPageRoute(builder: (_) => const CourseDetails());
      case home:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      case editor:
        return CupertinoPageRoute(builder: (_) => const DartCompilerApp());

      default:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
    }
  }

  static const String courseDetails = "/course_details";
  static const String home = "/";
  static const String editor = "/editor";

  static Future push(String routeName, {Object? arg}) async =>
      await navKey.currentState?.pushNamed(routeName, arguments: arg);

  static void pop({Object? arg}) async => navKey.currentState?.pop(arg);
}
