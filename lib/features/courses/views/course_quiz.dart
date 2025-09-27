import 'dart:convert';

import 'package:dartcoder/features/courses/models/course_model.dart';
import 'package:dartcoder/features/courses/models/quiz_model.dart';
import 'package:dartcoder/main.dart';
import 'package:dartcoder/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markdown_widget/config/configs.dart';
import 'package:markdown_widget/widget/markdown.dart';

class CourseQuiz extends StatefulWidget {
  const CourseQuiz({super.key, this.arg});
  final CourseQuizArg? arg;
  @override
  State<CourseQuiz> createState() => _CourseQuizState();
}

class _CourseQuizState extends State<CourseQuiz> {
  List<QuizModel> quizzes = [];

  void loadData(CourseModel course) async {
    await rootBundle.loadString(course.quiz ?? "").then((e) {
      quizzes = e == ""
          ? []
          : (json.decode(e) as List).map((e) => QuizModel.fromJson(e)).toList();

      // dataStr = e;
      // courseNotifier.value = course;
      // showNav.value = false;
      setState(() {});
      // tocController.jumpToIndex(0);
      // Reset scroll position to top when loading new data
      // scrollController.animateTo(
      //   0,
      //   duration: const Duration(milliseconds: 300),
      //   curve: Curves.easeInOut,
      // );
    });
  }

  @override
  void initState() {
    if (widget.arg?.course != null) loadData(widget.arg!.course!);
    super.initState();
  }

  MarkdownConfig config = isDarkTheme.value
      ? MarkdownConfig.darkConfig
      : MarkdownConfig.defaultConfig;
  @override
  Widget build(BuildContext context) {
//     [
//       {
//         "question": """
// complete the following Dart code to print "Hello, World!" to the console:

// ```dart
// void main() {
//   %order%%order%%order%

// }
// ```""",
//         "options": [
//           "print",
//           "('Wake up')",
//           ";",
//         ],
//         "answer": [
//           "print",
//           "('Wake up')",
//           ";",
//         ],
//         "type": "order"
//       },
//       {
//         "question": """
// What is the output of the following Dart code snippet?
// ```dart
// void main() {
//   Set<String> apples = {'Red', 'Green', 'Yellow', 'Yellow', 'Green'};

//   print(apples.length);
// }
// ```
// """,
//         "options": ["1", "2", "3", "Error"],
//         "answer": "3",
//         "type": "mcq"
//       },
//       {
//         "question": """
// Fill in the blank to complete the Dart enum and use it in a conditional statement:
// ```dart
// enum TrafficLight {
//   red,
//   yellow,
//   green,
// }

// void main() {
//   TrafficLight light = TrafficLight.red;

//   if (light == %fill%) {
//     print('Stop! 🛑');
//   } else if (light == TrafficLight.yellow) {
//     print('Get Ready! ⚠️');
//   } else if (%fill% == TrafficLight.green) {
//     print('Go! 🟢');
//   }
// }
// ```

// """,
//         "answer": ["TrafficLight.red"],
//         "type": "fill"
//       }
//     ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arg?.course?.title ?? "Quiz"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: DefaultTabController(
          length: quizzes.length,
          child: TabBarView(
            children: quizzes.map((e) {
              return Column(
                key: ValueKey(e.question),
                children: [
                  MarkdownWidget(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    data: e.question ?? "",
                    config: config,
                  ),
                  SizedBox(height: 20.h),
                  if (e.type == "order")
                    ...?e.options?.map((op) => Text(op)).toList(),
                  if (e.type == "mcq")
                    ...?e.options?.map((op) {
                      final selected = e.userAnswer == op;
                      return GestureDetector(
                        onTap: () {
                          final index = quizzes.indexOf(e);
                          quizzes[index] =
                              e.copyWith(userAnswer: selected ? null : op);

                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: selected
                                ? AppColors.appBlue.withValues(alpha: .2)
                                : Theme.of(context).scaffoldBackgroundColor,
                            border: Border.all(
                                color: (selected
                                        ? AppColors.appBlue
                                        : AppColors.grey)
                                    .withValues(alpha: .5)),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withValues(alpha: .05),
                                blurRadius: 8,
                                spreadRadius: 2,
                                offset: const Offset(0, 4),
                              ),
                              BoxShadow(
                                color: AppColors.grey.withValues(alpha: .01),
                                blurRadius: 4,
                                spreadRadius: 1,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 10.h),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(1.sp),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: selected
                                            ? AppColors.appBlue
                                            : AppColors.grey),
                                  ),
                                  child: Icon(
                                    Icons.circle,
                                    size: 10.sp,
                                    color: selected
                                        ? AppColors.appBlue
                                        : Colors.transparent,
                                  ),
                                ),
                                SizedBox(width: 15.w),
                                Expanded(
                                  child: Text(
                                      op
                                          .replaceAll("\n", "\n")
                                          .replaceAll("\\n", "\n"),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(fontSize: 15.sp)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class CourseQuizArg {
  final CourseModel? course;
  CourseQuizArg({this.course});
}
