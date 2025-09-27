import 'package:equatable/equatable.dart';

class QuizModel extends Equatable {
  final String? question;
  final List<String>? options;
  final dynamic answer;
  final dynamic userAnswer;
  final String? type;

  bool get isCorrect {
    if (userAnswer == null) return false;
    if (type == "mcq" || type == "fill") {
      return userAnswer == answer;
    } else if (type == "order") {
      if (userAnswer is List && answer is List) {
        List ua = userAnswer as List;
        List a = answer as List;
        if (ua.length != a.length) return false;
        for (int i = 0; i < ua.length; i++) {
          if (ua[i] != a[i]) return false;
        }
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  QuizModel({
    this.question,
    this.options,
    this.answer,
    this.type,
    this.userAnswer,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        question: json["question"],
        options: json["options"] == null
            ? []
            : List<String>.from(json["options"]!.map((x) => x)),
        answer: json["answer"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "options":
            options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
        "answer": answer,
        "type": type,
      };

  QuizModel copyWith({
    String? question,
    List<String>? options,
    dynamic answer,
    dynamic userAnswer,
    String? type,
  }) {
    return QuizModel(
      question: question ?? this.question,
      options: options ?? this.options,
      answer: answer ?? this.answer,
      userAnswer: userAnswer,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [question, options, answer, userAnswer, type];
}
