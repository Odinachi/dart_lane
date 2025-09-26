import 'package:dartcoder/shared/constants.dart';
import 'package:dartcoder/shared/navigation/router.dart';
import 'package:dartcoder/views/widgets/animted_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markdown_widget/markdown_widget.dart';

import '../features/courses/models/course_model.dart';
import '../main.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key, this.arg});
  final CourseDetailsArgs? arg;

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  final tocController = TocController();

  final courseNotifier = ValueNotifier(
    CourseModel(
      title: "Main",
      path: "assets/courses/main.md",
      id: 0,
    ),
  );

  void loadData(CourseModel course) async {
    await rootBundle.loadString(course.path ?? "").then((e) {
      dataStr = e;
      courseNotifier.value = course;
      showNav.value = false;
      setState(() {});
      tocController.jumpToIndex(0);
    });
  }

  String dataStr = "";

  @override
  void initState() {
    super.initState();
    loadData(courseNotifier.value);
    showNav.value = false;
  }

  MarkdownConfig config = isDarkTheme.value
      ? MarkdownConfig.darkConfig
      : MarkdownConfig.defaultConfig;

  final showNav = ValueNotifier(false);

  final courses = AppData.courses;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: courseNotifier,
        builder: (_, value, __) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(value.title ?? ""),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                children: [
                  NotificationListener(
                    onNotification: (ScrollNotification notification) {
                      if (notification is ScrollEndNotification) {
                        if (notification.metrics.pixels >=
                            notification.metrics.maxScrollExtent - 20) {
                          showNav.value = true;
                        } else {
                          showNav.value = false;
                        }
                      }
                      return true;
                    },
                    child: MarkdownWidget(
                      padding: EdgeInsets.only(bottom: 150.h),
                      data: dataStr,
                      config: config,
                      tocController: tocController,
                    ),
                  ),
                  ValueListenableBuilder(
                      valueListenable: showNav,
                      builder: (_, show, __) {
                        return Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: AnimatedBottomNav(
                            onQuiz: () {},
                            isVisible: show,
                            onPrevious: () {
                              if (courseNotifier.value.id != 0) {
                                final item = courses.values
                                    .toList()
                                    .reduce((value, element) => value + element)
                                    .where((e) =>
                                        e.id == (courseNotifier.value.id! - 1))
                                    .firstOrNull;
                                if (item != null) {
                                  loadData(item);
                                }
                              } else {
                                AppRouter.showMessage(
                                    "This is the first course");
                              }
                            },
                            onEditor: () {
                              AppRouter.push(AppRouter.editor);
                            },
                            onNext: () {
                              if (courseNotifier.value.id != 33) {
                                final item = courses.values
                                    .toList()
                                    .reduce((value, element) => value + element)
                                    .where((e) =>
                                        e.id == (courseNotifier.value.id! + 1))
                                    .firstOrNull;
                                if (item != null) {
                                  loadData(item);
                                }
                              } else {
                                AppRouter.showMessage(
                                    "This is the last course");
                              }
                            },
                          ),
                        );
                      })
                ],
              ),
            ),
          );
        });
  }
}

class CourseDetailsArgs {
  final CourseModel course;
  CourseDetailsArgs({required this.course});
}
