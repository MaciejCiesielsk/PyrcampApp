import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pyrcamp_app/features/faq_screen/faq_question_model.dart';

class FaqQuestionScreen extends StatelessWidget {
  const FaqQuestionScreen({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection(question.collectionName).snapshots(),
        builder: (context, snapshot) {
          // loading screen
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          //loading errors
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error frajerze'),
            );
          }

          // if empty error
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No questions found'),
            );
          }

          final loadedQuestions = snapshot.data!.docs;

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                  'FAQ QUESTIONS'), //TODO zmienna tutaj nazwa kolekcji
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: 700,
                        height: 2000,
                        child: ListView.builder(
                          itemCount: loadedQuestions.length,
                          itemBuilder: (context, index) {
                            final currentQuestion = loadedQuestions[index].data();
                    
                            //TODO w innym pliku docelowo
                            return ElevatedButton(
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text(currentQuestion['question']),
                                    content: Text(currentQuestion['answer']),
                                ),
                              ),
                              child: Text(
                                currentQuestion['question'],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          );
        });
  }
}
