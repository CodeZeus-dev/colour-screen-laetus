import 'package:color_details_screen/screens/color_details.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Proxima Nova',
      ),
      routes: <String, WidgetBuilder>{
        '/color/details': (context) => ColorDetailsScreen()
      },
      home: Scaffy(),
    );
  }
}

class Scaffy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/color/details');
            },
            child: Text('Check info here...'),
          ),
        ),
      ),
    );
  }
}
