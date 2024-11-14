import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fon_hakaton_2024/src/materialTheme.dart';
import 'dart:math';

import 'package:fon_hakaton_2024/src/models/storage.dart';

class LearnWordsPage extends StatefulWidget {
  @override
  _LearnWordsPageState createState() => _LearnWordsPageState();
}

class _LearnWordsPageState extends State<LearnWordsPage> {
  // final List<WordPair> wordPairs = [
  //   WordPair('Hello', 'Привет'),
  //   WordPair('Goodbye', 'До свидания'),
  //   WordPair('Thank you', 'Спасибо'),
  //   WordPair('Yes', 'Да'),
  //   WordPair('No', 'Нет'),
  //   WordPair('Please', 'Пожалуйста'),
  //   WordPair('Sorry', 'Извините'),

  // Mapping of languages to their translations
  Map<String, List<String>> translatedWordPairs = {
    'English': [
      'Hello',
      'Goodbye',
      'Thank you',
      'Yes',
      'No',
      'Please',
      'Sorry',
    ],
    'Russian': [
      'Привет',
      'До свидания',
      'Спасибо',
      'Да',
      'Нет',
      'Пожалуйста',
      'Извините',
    ],
    'German': [
      'Hallo',
      'Auf Wiedersehen',
      'Danke',
      'Ja',
      'Nein',
      'Bitte',
      'Entschuldigung',
    ],
    'Spanish': [
      'Hola',
      'Adiós',
      'Gracias',
      'Sí',
      'No',
      'Por favor',
      'Lo siento',
    ],
    "Serbian": [
      'Zdravo',
      'Doviđenja',
      'Hvala',
      'Da',
      'Ne',
      'Molim',
      'Izvini',
    ],
    "Chinese": [
      '你好 (Nǐ hǎo)',
      '再见 (Zàijiàn)',
      '谢谢 (Xièxiè)',
      '是 (Shì)',
      '不 (Bù)',
      '请 (Qǐng)',
      '对不起 (Duìbùqǐ)',
    ]
  };

  int currentIndex = 0;

  void nextWord() {
    setState(() {
      currentIndex = currentIndex + 1;
      Storage.isFlipped = false;
    });
  }

  @override
  void initState() {
    Storage.isFlipped = false;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Flashcards'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            Storage.isFlipped = !Storage.isFlipped;
          });
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: Storage.isFlipped
                  ? WordCard(
                      translatedWordPairs[Storage.language]![currentIndex])
                  : WordCard(translatedWordPairs[
                      Storage.country_to_lang[Storage.country]]![currentIndex]),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: nextWord,
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
          ),
          backgroundColor: materialThemeData.colorScheme.primary),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

class WordCard extends StatelessWidget {
  final String word;
  FlutterTts flutterTts = FlutterTts();

  WordCard(this.word);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: materialThemeData.colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            word,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              String? lang = Storage.isFlipped
                  ? Storage.tts_lang[Storage.language]
                  : Storage.tts_lang[Storage.country_to_lang[Storage.country]];
              flutterTts.setLanguage(lang ?? "en-US");
              var result = await flutterTts.speak(word);
              // if (result == 1) setState(() => ttsState = TtsState.playing);
            }, // Placeholder for button action
            child: Icon(Icons.volume_up),
          ),
        ],
      ),
    );
  }
}

class WordPair {
  final String word1;
  final String word2;

  WordPair(this.word1, this.word2);
}
