import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hajir_jawaf/components/action_button.dart';
import 'package:hajir_jawaf/components/gradient_box.dart';
import 'package:hajir_jawaf/components/rank_auth_button.dart';
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
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('questions')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final questionDocs = snapshot.data!.docs;

                  final questions = questionDocs
                      .map((e) => Question.fromQueryDocumentSnapshot(e))
                      .toList();

                  return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('config')
                        .snapshots(),
                    builder: (context, snapshot) {
                      print(snapshot.error);
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final configDoc = snapshot.data!.docs.first.data()
                          as Map<String, dynamic>;
                      final totalTime = configDoc['key'];

                      return Column(
                        children: [
                          ActionButton(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => QuizScreen(
                                    totalTime: totalTime,
                                    questions: questions,
                                  ),
                                ),
                              );
                            },
                            title: 'Start',
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Total Questions: ${questions.length}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 70),
              RankAuthButton()
            ],
          ),
        ),
      ),
    );
  }
}
