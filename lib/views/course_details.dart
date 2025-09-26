import 'package:dartcoder/models/course_model.dart';
import 'package:dartcoder/shared/app_data.dart';
import 'package:dartcoder/shared/navigation/router.dart';
import 'package:dartcoder/views/widgets/animted_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown_widget/markdown_widget.dart';

import '../main.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

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
            endDrawer: Container(
              width: MediaQuery.of(context).size.width * .8,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            AppRouter.pop();
                          },
                          icon: const Icon(Icons.close),
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                            child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, i) {
                        final listOfCourses = courses.keys.toList();

                        final category = listOfCourses.toList()[i];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              category,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            ListView.separated(
                              padding: const EdgeInsets.only(bottom: 50),
                              separatorBuilder: (_, __) => Divider(
                                color: Theme.of(context).dividerColor,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (_, j) {
                                final courseData =
                                    courses[listOfCourses[i]]?[j];

                                final courseName = courseData?.title;
                                return InkWell(
                                  onTap: () {
                                    AppRouter.pop();

                                    if (courseData != null) {
                                      loadData(courseData);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Text(
                                      courseName ?? '',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                );
                              },
                              itemCount: courses[listOfCourses[i]]?.length ?? 0,
                            )
                          ],
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: courses.keys.length,
                    )))
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              centerTitle: true,
              title: Text(value.title ?? ""),
              actions: [
                ValueListenableBuilder(
                    valueListenable: isDarkTheme,
                    builder: (_, isDark, __) {
                      return GestureDetector(
                        onTap: () {
                          isDarkTheme.value = !isDarkTheme.value;
                          config = !isDark
                              ? MarkdownConfig.darkConfig
                              : MarkdownConfig.defaultConfig;
                        },
                        child: Icon(
                          isDark ? Icons.sunny : Icons.dark_mode,
                          // color: isDark ? AppColors.white : AppColors.black,
                        ),
                      );
                    }),
                const SizedBox(
                  width: 20,
                ),
                Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: const Icon(Icons.menu),
                  );
                }),
                const SizedBox(
                  width: 20,
                )
              ],
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
                      padding: const EdgeInsets.only(bottom: 150),
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
