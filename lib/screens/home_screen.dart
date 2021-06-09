import 'package:flutter/material.dart';
import 'package:hajir_jawaf/components/action_button.dart';
import 'package:hajir_jawaf/components/gradient_box.dart';
import 'package:hajir_jawaf/models/question.dart';
import 'package:hajir_jawaf/screens/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: GradientBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'हाजिर जवाफ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 40),
              ActionButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        totalTime: 10,
                        questions: question,
                      ),
                    ),
                  );
                },
                title: 'Start',
              )
            ],
          ),
        ),
      ),
    );
  }
}
