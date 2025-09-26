import 'package:dartcoder/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../features/courses/models/course_model.dart';

class AppData {
  static final courses = {
    "Basics": [
      CourseModel(
          title: "Introduction",
          path: "assets/courses/main.md",
          id: 0,
          desc: "Introduction to Dart programming language.",
          videos: [
            "https://youtu.be/Gd97ql0gW9Q?si=qK3oJ5dE6RzfaG05",
            "https://youtu.be/XUuS82_lUTk?si=MUvf25uPgYh0n8ev",
          ]),
      CourseModel(
          title: "Variables and Data Types",
          path: "assets/courses/variables.md",
          id: 1,
          desc:
              "Learn about variables and data types in Dart and their usage."),
      CourseModel(
          title: "Operators",
          path: "assets/courses/operators.md",
          id: 2,
          desc: "Learn about different operators in Dart and how to use them."),
      CourseModel(
        title: "Comments",
        path: "assets/courses/comments.md",
        id: 3,
        desc: "Learn how to write comments in Dart code.",
      ),
      CourseModel(
        title: "Input/Output",
        path: "assets/courses/input_output.md",
        id: 4,
        canPractice: false,
        desc: "Learn how to handle input and output in Dart applications.",
      ),
      CourseModel(
        title: "Control Flow",
        path: "assets/courses/control_flow.md",
        id: 5,
        desc:
            "Understand control flow statements in Dart such as if-else and switch-case.",
      ),
      CourseModel(
        title: "Switch case",
        path: "assets/courses/switch_case.md",
        id: 6,
        desc:
            "Learn how to use switch-case statements in Dart for multi-way branching.",
      ),
      CourseModel(
        title: "For Loops",
        path: "assets/courses/for_loops.md",
        id: 7,
        desc: "Learn how to use for loops in Dart for iteration.",
      ),
      CourseModel(
        title: "While Loops",
        path: "assets/courses/while_loop.md",
        id: 8,
        desc: "Learn how to use while loops in Dart for iteration.",
      ),
      CourseModel(
        title: "Do-While Loops",
        path: "assets/courses/do_while.md",
        id: 9,
        desc: "Learn how to use do-while loops in Dart for iteration.",
      ),
      CourseModel(
        title: "List",
        path: "assets/courses/list.md",
        id: 10,
        desc: "Learn about lists in Dart and how to use them.",
      ),
      CourseModel(
        title: "Sets",
        path: "assets/courses/sets.md",
        id: 11,
        desc: "Learn about sets in Dart and how to use them.",
      ),
      CourseModel(
        title: "Maps",
        path: "assets/courses/map.md",
        id: 12,
        desc: "Learn about maps in Dart and how to use them.",
      ),
      CourseModel(
        title: "Functions",
        path: "assets/courses/functions.md",
        id: 12,
        desc: "Learn about functions in Dart and how to use them.",
      ),
      CourseModel(
        title: "Enums",
        path: "assets/courses/enum.md",
        id: 13,
        desc: "Learn about enums in Dart and how to use them.",
      ),
      CourseModel(
        title: "Null Safety",
        path: "assets/courses/null_safe.md",
        id: 14,
        desc: "Learn about null safety in Dart and how to use it.",
      ),
    ],
    "Intermediate": [
      CourseModel(
        title: "Classes and objects",
        path: "assets/courses/classes.md",
        id: 15,
        desc: "Learn about classes and objects in Dart and how to use them.",
      ),
      CourseModel(
        title: "Inheritance",
        path: "assets/courses/inheritance.md",
        id: 16,
        desc: "Learn about inheritance in Dart and how to use it.",
      ),
      CourseModel(
        title: "Abstract Class",
        path: "assets/courses/abstract_class.md",
        id: 17,
        desc: "Learn about abstract classes in Dart and how to use them.",
      ),
      CourseModel(
        title: "Mixins",
        path: "assets/courses/mixins.md",
        id: 18,
        desc: "Learn about mixins in Dart and how to use them.",
      ),
      CourseModel(
        title: "Getters and Setters",
        path: "assets/courses/getters_setters.md",
        id: 19,
        desc: "Learn about getters and setters in Dart and how to use them.",
      ),
      CourseModel(
        title: "Anonymous Functions",
        path: "assets/courses/anonymous_functions.md",
        id: 20,
        desc: "Learn about anonymous functions in Dart and how to use them.",
      ),
      CourseModel(
        title: "Higher-Order Functions",
        path: "assets/courses/higher_order_function.md",
        id: 21,
        desc: "Learn about higher-order functions in Dart and how to use them.",
      ),
      CourseModel(
        title: "Closures",
        path: "assets/courses/closure.md",
        id: 22,
        desc: "Learn about closures in Dart and how to use them.",
      ),
      CourseModel(
        title: "Try-Catch, finally",
        path: "assets/courses/try_catch_finally.md",
        id: 23,
        desc: "Learn about try-catch-finally in Dart and how to use it.",
      ),
      CourseModel(
        title: "Custom Exception",
        path: "assets/courses/custom_exception.md",
        id: 24,
        desc: "Learn about custom exceptions in Dart and how to use them.",
      ),
    ],
    "Advanced": [
      CourseModel(
        title: "Futures",
        path: "assets/courses/future.md",
        id: 25,
        desc: "Learn about futures in Dart and how to use them.",
      ),
      CourseModel(
        title: "Async/Await",
        path: "assets/courses/async_await.md",
        id: 26,
        desc: "Learn about async/await in Dart and how to use it.",
      ),
      CourseModel(
        title: "Streams",
        path: "assets/courses/stream.md",
        id: 27,
        desc: "Learn about streams in Dart and how to use them.",
      ),
      CourseModel(
        title: "Generics",
        path: "assets/courses/generics.md",
        id: 28,
        desc: "Learn about generics in Dart and how to use them.",
      ),
      CourseModel(
        title: "Extension Methods",
        path: "assets/courses/extension.md",
        id: 29,
        desc: "Learn about extension methods in Dart and how to use them.",
      ),
      CourseModel(
        title: "Sealed Classes",
        path: "assets/courses/sealed_classes.md",
        id: 30,
        desc: "Learn about sealed classes in Dart and how to use them.",
      ),
      CourseModel(
        title: "Unit Testing (Basic)",
        path: "assets/courses/unit_test.md",
        id: 31,
        desc: "Learn about unit testing in Dart and how to use it.",
      ),
      CourseModel(
        title: "Isolates",
        path: "assets/courses/isolates.md",
        id: 32,
        desc: "Learn about isolates in Dart and how to use them.",
      ),
      CourseModel(
        title: "Collection Methods",
        path: "assets/courses/collection_method.md",
        id: 33,
        desc: "Learn about collection methods in Dart and how to use them.",
      ),
    ]
  };
}

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.leftIcon,
      this.text = '',
      this.backgroundColor,
      this.textColor,
      this.onTap,
      this.borderColor});
  final Widget? leftIcon;
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border:
                borderColor != null ? Border.all(color: borderColor!) : null,
            color: backgroundColor ?? AppColors.appBlue),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIcon != null) leftIcon!,
            if (leftIcon != null) SizedBox(width: 10.w),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
