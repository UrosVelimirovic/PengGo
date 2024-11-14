import 'package:flutter/material.dart';
import 'package:fon_hakaton_2024/src/materialTheme.dart';
import 'package:fon_hakaton_2024/src/models/texts.dart';
import 'package:fon_hakaton_2024/src/screens/LearnWordsPage.dart';
import 'package:fon_hakaton_2024/src/screens/PinSelectedScreen.dart';
import 'package:fon_hakaton_2024/src/screens/TipsScreen.dart';
import 'package:fon_hakaton_2024/src/screens/translations.dart';

class OfflineMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Offline mode',
            style: TextStyle(
              color: const Color.fromARGB(
                  255, 0, 0, 0), // Set the font color of the text
            ),
          ),
        ),
        body: Column(children: [
          Expanded(
            child: Center(
              child: HomePage(),
            ),
          ),
          //   SizedBox(
          //     height: 400, // Fixed height for the bottom text container
          //     child: LowInfo()
          //   ),
          // ],
        ]));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Offset _currentPosition;
  late Offset _targetPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Adjust duration as needed
    );
    _currentPosition = Offset(0, 0);
    _targetPosition = Offset(0, 0);
    _animation = Tween<Offset>(
      begin: _currentPosition,
      end: _targetPosition,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateTargetPosition(Offset position) {
    setState(() {
      _targetPosition = position;
      _animation = Tween<Offset>(
        begin: _currentPosition,
        end: _targetPosition,
      ).animate(_controller);
      _controller.forward(from: 0); // Start or continue the animation
      _currentPosition = _targetPosition; // Update current position

      // if(checkHotel())
      // {
      //   //lowInfoKey.currentState?.changeText();
      //   //lowInfo.changeText();
      // }
      print('ovo je ');
      print(_currentPosition);
    });
  }

  int objectCheck() {
    double x = _currentPosition.dx;
    double y = _currentPosition.dy;
    if (x >= 0.0 && x <= 67.0 && y >= 182.1 && y <= 236.9) {
      return 1; // park
    }
    if (x >= 113.1 && x <= 158.1 && y >= 184.0 && y <= 235.8) {
      return 2; // police
    }
    if (x >= 207.2 && x <= 255.2 && y >= 193.9 && y <= 225.1) {
      return 3; // hospital
    }
    if (x >= 304.4 && x <= 346.3 && y >= 280.0 && y <= 318.1) {
      return 4; // hotel
    }
    if (x >= 294.5 && x <= 335.2 && y >= 9.9 && y <= 48.8) {
      return 5; // bank
    }
    if (x >= 301.3 && x <= 341.3 && y >= 448.0 && y <= 498.3) {
      return 6; // grocery
    }
    if (x >= 33.9 && x <= 72.0 && y >= 350.1 && y <= 395.0) {
      return 7; // train
    }
    if (x >= 111.2 && x <= 158.1 && y >= 356.2 && y <= 393.9) {
      return 8; // gas
    }
    if (x >= 14.1 && x <= 65.1 && y >= 442.3 && y <= 484.9) {
      return 9; // church
    }
    if (x >= 115.0 && x <= 154.3 && y >= 444.1 && y <= 484.9) {
      return 10; // restaurant
    }
    if (x >= 209.1 && x <= 248.4 && y >= 286.1 && y <= 339.0) {
      return 11; // bus
    }
    if (x >= 0.0 && x <= 179.0 && y >= 0.0 && y <= 139.0) {
      return 12; // airport
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTapDown: (TapDownDetails details) {
          _updateTargetPosition(details.localPosition);
        },
        child: Stack(
          children: [
            Image.asset(
              'assets/images/survivalmap2.png', // Replace with your bottom image path
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Positioned(
                  left: _animation.value.dx,
                  top: _animation.value.dy,
                  child: child!,
                );
              },
              child: GestureDetector(
                onTapDown: (TapDownDetails details) {
                  // Prevent tapping through the top image to the bottom image
                  // Uncomment the line below if you want to allow tapping through
                  // details.stopPropagation();
                },
                child: Image.asset(
                  'assets/images/pengsquare.png', // Replace with your top image path
                  width: 30, // Adjust width as needed
                  height: 30, // Adjust height as needed
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
          height: 150, // Fixed height for the bottom text container
          child: LowInfo(objectCheck())),
    ]);
  }
}

class LowInfo extends StatefulWidget {
  int position = 0;
  LowInfo(this.position) {}

  @override
  _LowInfoState createState() => _LowInfoState();
}

class _LowInfoState extends State<LowInfo> {
  late String _selectedTitle;
  String _selected = 'NONE';
  String _selectedTips = 'NONE';

  @override
  void initState() {
    super.initState();
    _selectedTitle = _infoText;
  }

  @override
  void didUpdateWidget(covariant LowInfo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.position == 1) {
      print(1);
      setState(() {
        _selectedTitle = En.parkTitle;
        _selected = En.park;
        _selectedTips = En.park_tips;
      });
    } else if (widget.position == 2) {
      print(2);
      setState(() {
        _selectedTitle = En.policeTitle;
        _selected = En.police;
        _selectedTips = En.police_tips;
      });
    } else if (widget.position == 3) {
      print(3);
      setState(() {
        _selectedTitle = En.hospitalTitle;
        _selected = En.hospital;
        _selectedTips = En.hospital_tips;
      });
    } else if (widget.position == 4) {
      print(4);
      setState(() {
        _selectedTitle = En.hotelTitle;
        _selected = En.hotel;
        _selectedTips = En.hotel_tips;
      });
    } else if (widget.position == 5) {
      print(5);
      setState(() {
        _selectedTitle = En.bankTitle;
        _selected = En.bank;
        _selectedTips = En.bank_tips;
      });
    } else if (widget.position == 6) {
      print(6);
      setState(() {
        _selectedTitle = En.groceryTitle;
        _selected = En.grocery;
        _selectedTips = En.grocery_tips;
      });
    } else if (widget.position == 7) {
      print(7);
      setState(() {
        _selectedTitle = En.trainTitle;
        _selected = En.train;
        _selectedTips = En.train_tips;
      });
    } else if (widget.position == 8) {
      print(8);
      setState(() {
        _selectedTitle = En.gasTitle;
        _selected = En.gas;
        _selectedTips = En.gas_tips;
      });
    } else if (widget.position == 9) {
      print(9);
      setState(() {
        _selectedTitle = En.churchTitle;
        _selected = En.church;
        _selectedTips = En.church_tips;
      });
    } else if (widget.position == 10) {
      print(10);
      setState(() {
        _selectedTitle = En.restaurantTitle;
        _selected = En.restaurant;
        _selectedTips = En.restaurant_tips;
      });
    } else if (widget.position == 11) {
      print(11);
      setState(() {
        _selectedTitle = En.busTitle;
        _selected = En.bus;
        _selectedTips = En.bus_tips;
      });
    } else if (widget.position == 12) {
      print(12);
      setState(() {
        _selectedTitle = En.airportTitle;
        _selected = En.airport;
        _selectedTips = En.airport_tips;
      });
    } else {
      print(0);
      setState(() {
        _selectedTitle = _infoText;
        _selected = 'NONE';
        _selectedTips = 'NONE';
      });
    }
  }

  String _infoText = 'Go, Go!';
  String hotelEtiquetteInChina = '''
        Hotel Etiquette in China

        1. Politeness: Greet hotel staff with "Nín hǎo" (您好) and be punctual for check-in and check-out.
        2. Language: Learn basic phrases like "Wǒ zhù zài zhèlǐ" (我住在这里) for "I am staying here."
        3. Respect: Treat hotel property with care, remove shoes before entering rooms, and follow hotel rules.
        4. No Tipping: Tipping is not customary; quality service is typically included in the price.
        5. Environmental Awareness: Conserve energy and water, and provide feedback respectfully if needed.

        By adhering to these guidelines, you can have a pleasant stay in Chinese hotels.
        ''';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // Background color
          //padding:EdgeInsets.symmetric(vertical: 20), // Padding around the text
          child: Center(
            child: Text(
              _selectedTitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add spacing between buttons
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 0, 0, 0)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TipsScreen(_selectedTips)),
                );
              },
              child: Text('Tips'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 0, 0, 0)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearnWordsPage()),
                );
              },
              child: Text('Words'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 0, 0, 0)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Translations()),
                );
              },
              child: Text('Sentences'),
            ),
          ],
        ),
      ],
    );
  }
}

class NewWidget extends StatelessWidget {
  final String text;

  NewWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Text(text),
      ),
    );
  }
}
