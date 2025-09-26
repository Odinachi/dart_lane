class CourseModel {
  final String? title;
  final String? path;
  final String? desc;
  final int? id;
  final bool? canPractice;
  final bool? isCourse;
  final bool? completed;

  CourseModel({
    this.title,
    this.path,
    this.id,
    this.desc,
    this.canPractice = true,
    this.isCourse = true,
    this.completed = false,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        title: json["title"],
        path: json["path"],
        id: json["id"],
        desc: json["desc"],
        canPractice: json["canPractice"],
        isCourse: json["isCourse"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "path": path,
        "id": id,
        "desc": desc,
        "canPractice": canPractice,
        "isCourse": isCourse,
        "completed": completed,
      };
}
