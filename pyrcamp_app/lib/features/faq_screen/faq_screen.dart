import 'package:flutter/material.dart';
import 'package:pyrcamp_app/features/faq_screen/faq_question_screen.dart';
import 'package:pyrcamp_app/features/faq_screen/faq_question_model.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FaqQuestionScreen(question: Question('FAQ_bilety'), // TODO: add variables instead of names of pages, to avoid changing every seperately
                    )));
              },
              child: const Text(
                'Bilety',
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FaqQuestionScreen(question: Question('FAQ_nocleg'),
                    )));
              },
              child: const Text(
                'Nocleg',
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FaqQuestionScreen(question: Question('FAQ_infra')),
                    ));
              },
              child: const Text(
                'Infrastruktura',
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FaqQuestionScreen(question: Question('FAQ_namiot')),
                    ));
              },
              child: const Text(
                'Sklep online i namioty',
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
