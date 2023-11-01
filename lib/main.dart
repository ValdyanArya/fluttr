import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'logic/changenotifier.dart'; // Adjust the import path accordingly
import 'myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplikasi Like',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
            // Optionally adjust other colors as needed
          ),
        ),
        home: MyHomePage(),
      ),
    );
  }
}
