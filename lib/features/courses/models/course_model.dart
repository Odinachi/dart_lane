class CourseModel {
  final String? title;
  final String? path;
  final int? id;

  CourseModel({
    this.title,
    this.path,
    this.id,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        title: json["title"],
        path: json["path"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "path": path,
        "id": id,
      };
}
