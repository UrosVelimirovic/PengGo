import 'package:flutter/material.dart';

class TipsPhrasesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'You have selected:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 40), // Increased space between the label and buttons
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TipsPage()));
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20), // Adjusted button padding
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Tips'),
            ),
          ),
          SizedBox(height: 16), // Increased space between buttons
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PhrasesPage()));
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20), // Adjusted button padding
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Phrases'),
            ),
          ),
        ],
      ),
    );
  }
}

class TipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips'),
      ),
      body: Center(
        child: Text('Tips Page'),
      ),
    );
  }
}

class PhrasesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phrases'),
      ),
      body: Center(
        child: Text('Phrases Page'),
      ),
    );
  }
}
