import '../models/course_model.dart';

class AppData {
  static final courses = {
    "Basics": [
      CourseModel(title: "Introduction", path: "assets/courses/main.md", id: 0),
      CourseModel(
        title: "Variables and Data Types",
        path: "assets/courses/variables.md",
        id: 1,
      ),
      CourseModel(
        title: "Operators",
        path: "assets/courses/operators.md",
        id: 2,
      ),
      CourseModel(
        title: "Comments",
        path: "assets/courses/comments.md",
        id: 3,
      ),
      CourseModel(
        title: "Input/Output",
        path: "assets/courses/input_output.md",
        id: 4,
      ),
      CourseModel(
        title: "Control Flow",
        path: "assets/courses/control_flow.md",
        id: 5,
      ),
      CourseModel(
        title: "Switch case",
        path: "assets/courses/switch_case.md",
        id: 6,
      ),
      CourseModel(
        title: "For Loops",
        path: "assets/courses/for_loops.md",
        id: 7,
      ),
      CourseModel(
        title: "While Loops",
        path: "assets/courses/while_loop.md",
        id: 8,
      ),
      CourseModel(
        title: "Do-While Loops",
        path: "assets/courses/do_while.md",
        id: 9,
      ),
      CourseModel(
        title: "List",
        path: "assets/courses/list.md",
        id: 10,
      ),
      CourseModel(
        title: "Sets",
        path: "assets/courses/sets.md",
        id: 11,
      ),
      CourseModel(
        title: "Maps",
        path: "assets/courses/map.md",
        id: 12,
      ),
      CourseModel(
        title: "Functions",
        path: "assets/courses/functions.md",
        id: 12,
      ),
      CourseModel(
        title: "Enums",
        path: "assets/courses/enum.md",
        id: 13,
      ),
      CourseModel(
        title: "Null Safety",
        path: "assets/courses/null_safe.md",
        id: 14,
      ),
    ],
    "Intermediate": [
      CourseModel(
        title: "Classes and objects",
        path: "assets/courses/classes.md",
        id: 15,
      ),
      CourseModel(
        title: "Inheritance",
        path: "assets/courses/inheritance.md",
        id: 16,
      ),
      CourseModel(
        title: "Abstract Class",
        path: "assets/courses/abstract_class.md",
        id: 17,
      ),
      CourseModel(
        title: "Mixins",
        path: "assets/courses/mixins.md",
        id: 18,
      ),
      CourseModel(
        title: "Getters and Setters",
        path: "assets/courses/getters_setters.md",
        id: 19,
      ),
      CourseModel(
        title: "Anonymous Functions",
        path: "assets/courses/anonymous_functions.md",
        id: 20,
      ),
      CourseModel(
        title: "Higher-Order Functions",
        path: "assets/courses/higher_order_function.md",
        id: 21,
      ),
      CourseModel(
        title: "Closures",
        path: "assets/courses/closure.md",
        id: 22,
      ),
      CourseModel(
        title: "Try-Catch, finally",
        path: "assets/courses/try_catch_finally.md",
        id: 23,
      ),
      CourseModel(
        title: "Custom Exception",
        path: "assets/courses/custom_exception.md",
        id: 24,
      ),
    ],
    "Advanced": [
      CourseModel(
        title: "Futures",
        path: "assets/courses/future.md",
        id: 25,
      ),
      CourseModel(
        title: "Async/Await",
        path: "assets/courses/async_await.md",
        id: 26,
      ),
      CourseModel(
        title: "Streams",
        path: "assets/courses/stream.md",
        id: 27,
      ),
      CourseModel(
        title: "Generics",
        path: "assets/courses/generics.md",
        id: 28,
      ),
      CourseModel(
        title: "Extension Methods",
        path: "assets/courses/extension.md",
        id: 29,
      ),
      CourseModel(
        title: "Sealed Classes",
        path: "assets/courses/sealed_classes.md",
        id: 30,
      ),
      CourseModel(
        title: "Unit Testing (Basic)",
        path: "assets/courses/unit_test.md",
        id: 31,
      ),
      CourseModel(
        title: "Isolates",
        path: "assets/courses/isolates.md",
        id: 32,
      ),
      CourseModel(
        title: "Collection Methods",
        path: "assets/courses/collection_method.md",
        id: 33,
      ),
    ]
  };
}
