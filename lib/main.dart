import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import './models/color_shift.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future getColour() async {
    var url = 'http://thecolorapi.com/id?hex=0dbc81';
    var response = await http.get(url);
    var jsonResponse = convert.json.decode(response.body);

    print(jsonResponse);

    return {
      'rgb': {
        'r': jsonResponse['rgb']['r'],
        'g': jsonResponse['rgb']['g'],
        'b': jsonResponse['rgb']['b']
      },
      'cymk': {
        'c': jsonResponse['cymk']['c'],
        'y': jsonResponse['cymk']['y'],
        'm': jsonResponse['cymk']['m'],
        'k': jsonResponse['cymk']['k']
      }
    };
  }

  Color _currentColour;
  Color _changingColour;

  double _currentSliderValue;
  Map<String, dynamic> _updatedColour;

  @override
  void initState() async {
    super.initState();
    Map colour = await getColour();
    _currentColour = Color.fromRGBO(
        colour['rgb']['r'], colour['rgb']['g'], colour['rgb']['b'], 1);
    Color _changingColour = Color.fromRGBO(
        colour['rgb']['r'], colour['rgb']['g'], colour['rgb']['b'], 1);
    // Update the RGBO values given a colour from the colour picker screen
    _updatedColour = {'r': 0, 'g': 0, 'b': 255, 'a': 0.5};
    _currentSliderValue = _updatedColour['a'] * 100;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Proxima Nova',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/LAETUS_LOGO.png',
            width: 120,
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'AND YOUR COLOUR IS:',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'PERIWINKLE',
                        style: TextStyle(
                          color: _currentColour,
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: SizedBox(
                        width: 170,
                        height: 170,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: _changingColour,
                            borderRadius: BorderRadius.all(
                              Radius.circular(22),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IntrinsicHeight(
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    'C',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                  Text(
                                    'M',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                  Text(
                                    'Y',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                  Text(
                                    'K',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                thickness: 1,
                                width: 20,
                                color: Colors.black,
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    '6.63',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '19.87',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                          height: 20,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: [
                                  Text(
                                    'R',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                  Text(
                                    'G',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                  Text(
                                    'B',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                  Text(
                                    'O',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                thickness: 1,
                                width: 20,
                                color: Colors.black,
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    _updatedColour['r'].toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    _updatedColour['g'].toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    _updatedColour['b'].toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    _updatedColour['a'].toStringAsFixed(2),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'SIMILAR COLOUR TONES',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 65,
                        child: Theme(
                          child: Slider(
                            value: _currentSliderValue,
                            min: 1,
                            max: 100,
                            divisions: 1000,
                            label: 'Text',
                            activeColor: _changingColour,
                            onChanged: (double value) {
                              setState(() {
                                _currentSliderValue = value;
                                _updatedColour = shiftColor(
                                    a: 1.0,
                                    r: _currentColourRGB[0],
                                    g: _currentColourRGB[1],
                                    b: _currentColourRGB[2],
                                    shiftValue: _currentSliderValue);
                                _changingColour = Color.fromRGBO(
                                    _updatedColour['r'],
                                    _updatedColour['g'],
                                    _updatedColour['b'],
                                    _updatedColour['a']);
                              });
                            },
                          ),
                          data: Theme.of(context).copyWith(
                            accentTextTheme: TextTheme(
                                bodyText2: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton(
                            onPressed: () {
                              getColour();
                            },
                            child: Text('RESET'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
