class UserProgressModel {
  final num? currentCourse;
  final List<num>? passedCourses;

  UserProgressModel({
    this.currentCourse,
    this.passedCourses,
  });

  UserProgressModel copyWith({
    num? currentCourse,
    List<num>? passedCourses,
  }) =>
      UserProgressModel(
        currentCourse: currentCourse ?? this.currentCourse,
        passedCourses: passedCourses ?? this.passedCourses,
      );

  factory UserProgressModel.fromJson(Map<String, dynamic> json) =>
      UserProgressModel(
        currentCourse: json["current_course"],
        passedCourses: json["passed_courses"] == null
            ? []
            : List<num>.from(json["passed_courses"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "current_course": currentCourse,
        "passed_courses": passedCourses == null
            ? []
            : List<dynamic>.from(passedCourses!.map((x) => x)),
      };
}
