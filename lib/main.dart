import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/modules/theme/my_theme.dart';
import 'package:movies_app/screens/Auth/decide_page.dart';
import 'package:movies_app/screens/Categories/selected_category_screen.dart';
import 'package:movies_app/screens/Home/home_screen.dart';
import 'package:movies_app/screens/Movie/movie_details.dart';
import 'package:movies_app/screens/Search/search_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DecidePage(),
      theme: MyTheme.lightTheme,
      routes: {
        HomeScreen.routeName:(context) => HomeScreen(),
        MovieDetails.routeName:(context) => MovieDetails(),
        SearchScreen.routeName:(context) => SearchScreen(),
        DecidePage.routeName:(context) => DecidePage(),
        SelectedCategoryScreen.routeName:(context) => SelectedCategoryScreen(),
      },
    );
  }
}
