import 'package:flutter/material.dart';
import 'package:news_sun_c9/ui/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName :(context)=> HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}


