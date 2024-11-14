import 'package:flutter/material.dart';

class Mapa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image covering the entire screen
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/mapsAirport.png'), // Replace 'background_image.jpg' with your image file
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Semi-transparent overlay
        Container(
          color:
              Colors.black.withOpacity(0.1), // Semi-transparent black overlay
        ),
        // Airplane icon positioned at the center of the screen
        Positioned(
            top: MediaQuery.of(context).size.height * 0.5 -
                50, // Adjust vertical position as needed
            left: MediaQuery.of(context).size.width * 0.5 +
                110, // Adjust horizontal position as needed
            child: GestureDetector(
              onTap: () {
                _showDialog(context);
              },
              child: Icon(
                Icons.airplanemode_active,
                color: const Color.fromARGB(255, 0, 0, 0),
                size: 75.0,
              ),
            )),
      ],
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Airplane Information"),
          content: Text("This is the information about the airplane."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
