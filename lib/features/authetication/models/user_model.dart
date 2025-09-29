class UserModel {
  final String? firstName;
  final String? lastName;
  final DateTime? createdAt;
  final String? currentLevel;
  final String? uid;
  final String? email;

  UserModel({
    this.firstName,
    this.lastName,
    this.createdAt,
    this.currentLevel,
    this.uid,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
        currentLevel: json["current_level"],
        uid: json["uid"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "createdAt": createdAt?.toIso8601String(),
        "current_level": currentLevel,
        "uid": uid,
        "email": email,
      };
}
