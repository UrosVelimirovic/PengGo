import 'package:flutter/material.dart';

class Translations extends StatelessWidget {
  final List<String> englishSentences = [
    'Hello, how are you?',
    'What is your name?',
    'I am from the United States.',
    'How can I help you?',
    'Nice to meet you!',
    'This is a new sentence for translation.',
    'Flutter is amazing!',
    'Thank you for using this app.',
    'Goodbye!',
  ];

  final Map<String, String> serbianTranslations = {
    'Hello, how are you?': 'Zdravo, kako si?',
    'What is your name?': 'Kako se zoveš?',
    'I am from the United States.': 'Ja sam iz Sjedinjenih Američkih Država.',
    'How can I help you?': 'Kako mogu da vam pomognem?',
    'Nice to meet you!': 'Drago mi je što vas upoznajem!',
    'This is a new sentence for translation.':
        'Ovo je nova rečenica za prevod.',
    'Flutter is amazing!': 'Flutter je neverovatan!',
    'Thank you for using this app.': 'Hvala vam što koristite ovu aplikaciju.',
    'Goodbye!': 'Doviđenja!',
  };

  @override
  Widget build(BuildContext context) {
    return TranslationPage(
        englishSentences: englishSentences,
        serbianTranslations: serbianTranslations);
  }
}

class TranslationPage extends StatefulWidget {
  final List<String> englishSentences;
  final Map<String, String> serbianTranslations;

  const TranslationPage({
    required this.englishSentences,
    required this.serbianTranslations,
  });

  @override
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  String? _selectedTranslation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English to Serbian Translation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                _selectedTranslation ?? '',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: widget.englishSentences.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.englishSentences[index]),
                  onTap: () {
                    setState(() {
                      _selectedTranslation = widget
                          .serbianTranslations[widget.englishSentences[index]];
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
