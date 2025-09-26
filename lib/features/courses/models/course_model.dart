class CourseModel {
  final String? title;
  final String? path;
  final String? desc;
  final int? id;
  final bool? canPractice;

  CourseModel({
    this.title,
    this.path,
    this.id,
    this.desc,
    this.canPractice = true,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        title: json["title"],
        path: json["path"],
        id: json["id"],
        desc: json["desc"],
        canPractice: json["canPractice"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "path": path,
        "id": id,
        "desc": desc,
        "canPractice": canPractice,
      };
}
