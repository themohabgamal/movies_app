import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/modules/theme/my_theme.dart';
import 'package:movies_app/screens/Account_settings/account_settings.dart';
import 'package:movies_app/screens/Categories/categories_grid_screen.dart';
import 'package:movies_app/screens/Home/components/search_delegate.dart';
import 'package:movies_app/screens/Home/home_page.dart';
import 'package:movies_app/screens/Search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled,size: 32),
                label: "Home",
                backgroundColor: MyTheme.secondaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_rounded,size: 32,),
                label: "Play",
                backgroundColor: MyTheme.secondaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.search,size: 34),
                label: "Search",
                backgroundColor: MyTheme.secondaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle,size: 32),
                label: "Profile",
                backgroundColor: MyTheme.secondaryColor),
          ],
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          currentIndex: selectedIndex,
        ),

    );
  }

  List<Widget> screens = [
    HomePage(),
    CategoryGridScreen(),
    SearchScreen(),
    AccountSettings(),
  ];
}
