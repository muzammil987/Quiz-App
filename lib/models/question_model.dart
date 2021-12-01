import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Question extends Equatable {
  final String category;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<String> answer;

  const Question({
    required this.category,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.answer,
  });

  @override
  List<Object> get props => [
        category,
        difficulty,
        question,
        answer,
        correctAnswer,
      ];

  factory Question.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return Question(
      category: map['category'] ?? '',
      difficulty: map['difficulty'] ?? '',
      question: map['question'] ?? '',
      correctAnswer: map['correctAnswer'] ?? '',
      answer: List<String>.from(map['incorrect_answer'] ?? [])
        ..add(map['correct_answer'] ?? '')
        ..shuffle(),
    );
  }
}
