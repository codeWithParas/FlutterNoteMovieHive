import 'package:flutter/material.dart';
import 'package:flutter_jan_batch/movieapp/repository/HiveDatabaseHandler.dart';
import 'LoginPage.dart';

void main() {
  HiveDatabaseHandler().initHiveDatabase();
  runApp(const AppFlutterWs());
}

// 2 types of widget 1- Stateless 2- Stateful

class AppFlutterWs extends StatelessWidget {
  const AppFlutterWs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OnlineWsApp",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 3,
          backgroundColor: Colors.white
        )
      ),
      home: LoginScreen(),
    );
  }
}

