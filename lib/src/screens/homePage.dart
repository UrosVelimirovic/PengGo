import 'package:flutter/material.dart';
import 'package:fon_hakaton_2024/src/screens/profilePage.dart';

class HomePage extends StatelessWidget {
  final _pageControlller;
  HomePage(this._pageControlller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Color.fromARGB(255, 131, 36, 155)),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            _pageControlller.animateToPage(
              2,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
            );
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    ));
  }
}
