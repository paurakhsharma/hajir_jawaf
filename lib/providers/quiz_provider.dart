import 'package:flutter/material.dart';
import 'package:hajir_jawaf/models/question.dart';
import 'package:hajir_jawaf/models/quiz_user.dart';
import 'package:hajir_jawaf/services/quiz_service.dart';

class QuizProvider extends ChangeNotifier {
  int totalTime = 0;
  List<Question> questions = [];
  List<QuizUser> users = [];

  QuizProvider() {
    QuizService.getAllQuestions().then((value) {
      questions = value;
      notifyListeners();
    });

    QuizService.getTotalTime().then((value) {
      totalTime = value;
      notifyListeners();
    });
  }

  Future<void> getAllUsers() async {
    users = await QuizService.getAllUsers();
    notifyListeners();
  }

  Future<void> updateHighscore(int currentScore) async {
    await QuizService.updateHighscore(currentScore);
  }
}
