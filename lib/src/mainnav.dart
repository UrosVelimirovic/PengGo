import 'package:flutter/material.dart';
import 'package:fon_hakaton_2024/src/models/storage.dart';
import 'package:fon_hakaton_2024/src/screens/LearnWordsPage.dart';
import 'package:fon_hakaton_2024/src/screens/MainPage.dart';
import 'package:fon_hakaton_2024/src/screens/PinSelectedScreen.dart';
import 'package:fon_hakaton_2024/src/screens/TipsScreen.dart';
import 'package:fon_hakaton_2024/src/screens/TranslatePage.dart';
import 'package:fon_hakaton_2024/src/screens/mapa.dart';
import 'package:fon_hakaton_2024/src/screens/offlineMode.dart';
import 'package:fon_hakaton_2024/src/screens/translations.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import 'screens/homePage.dart';
import 'screens/cameraPage.dart';
import 'screens/profilePage.dart';
import "package:fon_hakaton_2024/src/materialTheme.dart";
import 'screens/shop_screen.dart';
import "package:fon_hakaton_2024/src/screens/shop_screen.dart";

class MainNav extends StatelessWidget {
  MainNav({super.key});
  Storage storage = new Storage();

  final _pageControlller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Bottom Navigation Bar App")),
      body: PageView(
        controller: _pageControlller,
        children: <Widget>[
          //HomePage(_pageControlller),
          MainPage(storage),
          OfflineMode(),
          Mapa(),
          //Translations(),
          ShopPage(),
          //LearnWordsPage()
          //ShopPage(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        color: Color.fromARGB(255, 255, 255, 255),
        controller: _pageControlller,
        flat: true,
        useActiveColorByDefault: false,
        items: [
          // #48CFAD, #37BC9B
          RollingBottomBarItem(Icons.home,
              label: 'Home',
              activeColor: materialThemeData.colorScheme.primary),
          RollingBottomBarItem(Icons.map,
              label: 'Learn',
              activeColor: materialThemeData.colorScheme.primary),
          RollingBottomBarItem(Icons.language,
              label: 'Explore',
              activeColor: materialThemeData.colorScheme.primary),
          RollingBottomBarItem(Icons.shop,
              label: 'Shop',
              activeColor: materialThemeData.colorScheme.primary),
        ],
        enableIconRotation: true,
        onTap: (index) {
          _pageControlller.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }
}
