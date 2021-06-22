import 'package:flutter/material.dart';
import 'package:hajir_jawaf/components/action_button.dart';
import 'package:hajir_jawaf/components/gradient_box.dart';
import 'package:hajir_jawaf/components/rank_auth_button.dart';
import 'package:hajir_jawaf/models/question.dart';
import 'package:hajir_jawaf/providers/quiz_provider.dart';
import 'package:hajir_jawaf/screens/quiz_screen.dart';

import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    Key? key,
    required this.score,
    required this.questions,
    required this.totalTime,
  }) : super(key: key);

  final int score;
  final List<Question> questions;
  final int totalTime;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: GradientBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Result: ${widget.score} / ${widget.questions.length}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 40),
              ActionButton(
                title: 'Play Again',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        totalTime: widget.totalTime,
                        questions: widget.questions,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 40),
              RankAuthButton()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final provider = context.read<QuizProvider>();
    provider.updateHighscore(widget.score);
  }
}
