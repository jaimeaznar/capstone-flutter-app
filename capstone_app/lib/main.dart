import 'package:capstone_app/src/pages/categories.dart';
import 'package:capstone_app/src/pages/recipe.dart';
import 'package:capstone_app/src/styles/styles.dart';
//import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './src/pages/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //admob
  // FirebaseAdMob.instance
  //     .initialize(appId: "ca-app-pub-3357084193642894~9122393852");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColorLight: colorTitles,
      ),
      debugShowCheckedModeBanner: true,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        'category': (BuildContext context) => CategoryPage(),
        'recipe': (BuildContext context) => RecipePage(),
      },
    );
  }
}
