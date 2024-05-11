import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generador de número aleatorio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomNumberPage(),
    );
  }
}

class RandomNumberPage extends StatefulWidget {
  @override
  _RandomNumberPageState createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  int randomNumber = 0;

  void generateRandomNumber() {
    setState(() {
      randomNumber = Random().nextInt(1000);
    });
  }

  String formatNumber(int number) {
    if (number < 10) {
      return "00$number";
    } else if (number < 100) {
      return "0$number";
    } else {
      return number.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generador de número aleatorio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Número Aleatorio:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              formatNumber(randomNumber),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: generateRandomNumber,
        tooltip: 'Generar Número Aleatorio',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
