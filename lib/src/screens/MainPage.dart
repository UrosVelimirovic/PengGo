import 'package:flutter/material.dart';
import 'package:fon_hakaton_2024/src/models/storage.dart';

class MainPage extends StatefulWidget {
  Storage storage;
  MainPage(this.storage);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PengGo',
          style: TextStyle(
            color: const Color.fromARGB(
                255, 0, 0, 0), // Set the font color of the text
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.lightBlueAccent, Colors.blueAccent],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Choose Language',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          value: Storage.language,
                          items: [
                            DropdownMenuItem(
                                value: 'Serbian',
                                child: Text('Serbian',
                                    style: TextStyle(color: Colors.black))),
                            DropdownMenuItem(
                                value: 'English',
                                child: Text('English',
                                    style: TextStyle(color: Colors.black))),
                            DropdownMenuItem(
                                value: 'Russian',
                                child: Text('Russian',
                                    style: TextStyle(color: Colors.black))),
                            DropdownMenuItem(
                                value: 'Spanish',
                                child: Text('Spanish',
                                    style: TextStyle(color: Colors.black))),
                            // DropdownMenuItem(
                            //     value: 'French',
                            //     child: Text('French',
                            //         style: TextStyle(color: Colors.black))),
                            DropdownMenuItem(
                                value: 'German',
                                child: Text('German',
                                    style: TextStyle(color: Colors.black))),
                            DropdownMenuItem(
                                value: 'Chinese',
                                child: Text('Chinese',
                                    style: TextStyle(color: Colors.black))),
                          ],
                          onChanged: (value) {
                            setState(() {
                              Storage.language = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Choose Country',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          value: Storage.country,
                          items: [
                            DropdownMenuItem(
                                value: '',
                                child: Text('USA',
                                    style: TextStyle(color: Colors.black))),
                            DropdownMenuItem(
                                value: 'Serbia',
                                child: Text('Serbia',
                                    style: TextStyle(color: Colors.black))),
                            DropdownMenuItem(
                                value: 'Russia',
                                child: Text('Russia',
                                    style: TextStyle(color: Colors.black))),
                            // DropdownMenuItem(
                            //     value: 'France',
                            //     child: Text('France',
                            //         style: TextStyle(color: Colors.black))),
                            DropdownMenuItem(
                                value: 'Germany',
                                child: Text('Germany',
                                    style: TextStyle(color: Colors.black))),
                            DropdownMenuItem(
                                value: 'China',
                                child: Text('China',
                                    style: TextStyle(color: Colors.black))),
                            DropdownMenuItem(
                                value: 'Japan',
                                child: Text('Japan',
                                    style: TextStyle(color: Colors.black))),
                            DropdownMenuItem(
                                value: 'Spain',
                                child: Text('Spain',
                                    style: TextStyle(color: Colors.black))),
                          ],
                          onChanged: (value) {
                            setState(() {
                              Storage.country = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 50.0), // Increased space for the button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmptyPage(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 12.0),
                          child: Text('Go', style: TextStyle(fontSize: 20.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empty Page'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            'Empty Page',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
