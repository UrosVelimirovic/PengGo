import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fon_hakaton_2024/src/models/storage.dart';

class TipsScreen extends StatefulWidget {
  String text;

  TipsScreen(this.text);

  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  List<String> lines = [];
  List<int> upvoteCounts = [];
  List<int> downvoteCounts = [];
  Set<int> likedTips = Set<int>();
  Set<int> dislikedTips = Set<int>();
  TextEditingController _newTipController = TextEditingController();

  @override
  void initState() {
    super.initState();

    lines = widget.text.split('\n');
    // Initialize vote counts
    Random random = Random();

    for (int i = 0; i < lines.length; i++) {
      int rand1 = random.nextInt(50) + 1;
      int rand2 = random.nextInt(50) + 1;

      upvoteCounts.add(rand1);
      downvoteCounts.add(rand2);
    }
  }

  @override
  void dispose() {
    _newTipController.dispose();
    super.dispose();
  }

  void addNewTip() {
    String newTip = _newTipController.text.trim();
    if (newTip.isNotEmpty) {
      setState(() {
        lines.add(newTip);
        // widget.storage.tips[widget.storage.language] =
        //     widget.storage.tips[widget.storage.language]! + "\n" + newTip;

        upvoteCounts.add(0);
        downvoteCounts.add(0);
        _newTipController.clear();
      });
    }
  }

  void toggleLike(int index) {
    setState(() {
      if (likedTips.contains(index)) {
        likedTips.remove(index);
        upvoteCounts[index]--;
      } else {
        likedTips.add(index);
        if (dislikedTips.contains(index)) {
          dislikedTips.remove(index);
          downvoteCounts[index]--;
        }
        upvoteCounts[index]++;
      }
    });
  }

  void toggleDislike(int index) {
    setState(() {
      if (dislikedTips.contains(index)) {
        dislikedTips.remove(index);
        downvoteCounts[index]--;
      } else {
        dislikedTips.add(index);
        if (likedTips.contains(index)) {
          likedTips.remove(index);
          upvoteCounts[index]--;
        }
        downvoteCounts[index]++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _newTipController,
                    decoration: InputDecoration(
                      hintText: 'Enter your new tip',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: addNewTip,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: lines.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tip ${index + 1}:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            lines[index],
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.thumb_up),
                                color: likedTips.contains(index)
                                    ? Colors.blue
                                    : null,
                                onPressed: () => toggleLike(index),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '${upvoteCounts[index]}',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(width: 16),
                              IconButton(
                                icon: Icon(Icons.thumb_down),
                                color: dislikedTips.contains(index)
                                    ? Colors.blue
                                    : null,
                                onPressed: () => toggleDislike(index),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '${downvoteCounts[index]}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
