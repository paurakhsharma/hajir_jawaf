import 'package:flutter/material.dart';
import 'package:hajir_jawaf/components/gradient_box.dart';
import 'package:hajir_jawaf/providers/quiz_provider.dart';

import 'package:provider/provider.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuizProvider>();
    return Scaffold(
      body: GradientBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                'Ranking',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              if (provider.users.isEmpty)
                Center(
                  child: CircularProgressIndicator(),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final user = provider.users[index];
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              user.photoUrl,
                            ),
                          ),
                          title: Text(
                            user.name,
                          ),
                          trailing: Text(
                            user.score.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: provider.users.length,
                  ),
                )
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
    provider.getAllUsers();
  }
}
