import 'dart:convert';
import 'dart:io';

import 'package:covid19/detailsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Countries',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final globalkey = GlobalKey<ScaffoldState>();

  bool _connection = false;

  static const double minExtent = 0.3;
  static const double maxExtent = 1.0;
  bool isExpanded = false;
  double initialExtent = minExtent;
  BuildContext draggableSheetContext;

  final List<String> _imageList = [
    "images/adventure.png",
    "images/Bus_stop.png",
    "images/around_the_world.png",
    "images/best_place.png",
    "images/audio_conversation.png",
    "images/pay_online.png",
    "images/time_management.png",
    "images/Eiffel_tower.png",
  ];

  final List<String> _titleList = [
    "Study About Countries",
    "Population",
    "Location Details",
    "Area",
    "Languages",
    "Currencies",
    "Timezones",
    "Other Details"
  ];

  List<bool> _pageState = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  int _imageNumber = 0;
  int _titleNumber = 0;

  var _countryDetails = [];

  _loadApiData() async {
    String requestURL = "https://restcountries.eu/rest/v2/all";
    http.Response response = await http.get(requestURL);

    setState(() {
      _countryDetails = json.decode(response.body);
    });
  }

  _checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _connection = true;
        _loadApiData();
      }
    } on SocketException catch (_) {
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        elevation: 2.0,
        content: Text(
          "No Internet Connection",
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
            letterSpacing: 3.0,
            shadows: [
              new Shadow(
                blurRadius: 3.0,
              ),
            ],
          ),
        ),
        action: SnackBarAction(
          label: "Exit",
          textColor: Colors.white,
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
      );
      globalkey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalkey,
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(top: 40.0),
              color: Color(0xFF69F0AE),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'COUNTRIES',
                        style: TextStyle(
                          fontSize: 38.0,
                          letterSpacing: 13.0,
                          shadows: [
                            new Shadow(
                              blurRadius: 8.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child:
                                          Image.asset(_imageList[_imageNumber]),
                                      width: MediaQuery.of(context).size.width -
                                          10,
                                      height: 250.0,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      _titleList[_titleNumber],
                                      style: TextStyle(
                                        color: Colors.purple,
                                        fontSize: 15.0,
                                        letterSpacing: 5.0,
                                        shadows: [
                                          new Shadow(
                                            blurRadius: 2.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 9.0, bottom: 9.0),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.brightness_1,
                                      size: _pageState[0] ? 15.0 : 12.0,
                                      color: _pageState[0]
                                          ? Colors.purple
                                          : Colors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 3.0),
                                    ),
                                    Icon(
                                      Icons.brightness_1,
                                      size: _pageState[1] ? 15.0 : 12.0,
                                      color: _pageState[1]
                                          ? Colors.purple
                                          : Colors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 3.0),
                                    ),
                                    Icon(
                                      Icons.brightness_1,
                                      size: _pageState[2] ? 15.0 : 12.0,
                                      color: _pageState[2]
                                          ? Colors.purple
                                          : Colors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 3.0),
                                    ),
                                    Icon(
                                      Icons.brightness_1,
                                      size: _pageState[3] ? 15.0 : 12.0,
                                      color: _pageState[3]
                                          ? Colors.purple
                                          : Colors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 3.0),
                                    ),
                                    Icon(
                                      Icons.brightness_1,
                                      size: _pageState[4] ? 15.0 : 12.0,
                                      color: _pageState[4]
                                          ? Colors.purple
                                          : Colors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 3.0),
                                    ),
                                    Icon(
                                      Icons.brightness_1,
                                      size: _pageState[5] ? 15.0 : 12.0,
                                      color: _pageState[5]
                                          ? Colors.purple
                                          : Colors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 3.0),
                                    ),
                                    Icon(
                                      Icons.brightness_1,
                                      size: _pageState[6] ? 15.0 : 12.0,
                                      color: _pageState[6]
                                          ? Colors.purple
                                          : Colors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 3.0),
                                    ),
                                    Icon(
                                      Icons.brightness_1,
                                      size: _pageState[7] ? 15.0 : 12.0,
                                      color: _pageState[7]
                                          ? Colors.purple
                                          : Colors.white,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 7.0),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black,
                                      ),
                                      tooltip: "Next Slide",
                                      onPressed: () {
                                        setState(() {
                                          if ((_imageNumber < 7)) {
                                            _imageNumber += 1;
                                            _titleNumber += 1;
                                          } else {
                                            _imageNumber = 0;
                                            _titleNumber = 0;
                                          }
                                          for (int x = 0; x <= 7; x++) {
                                            if (x == _imageNumber) {
                                              _pageState[x] = true;
                                            } else {
                                              _pageState[x] = false;
                                            }
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: RichText(
                              text: TextSpan(
                                text: 'Design by SlCodingTask\t\t\t',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 5.0,
                                  shadows: [
                                    new Shadow(
                                      blurRadius: 8.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          DraggableScrollableActuator(child: _buildDraggableScrollableSheet()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          if(_connection){
            if (draggableSheetContext != null) {
              setState(() {
                initialExtent = isExpanded ? minExtent : maxExtent;
                isExpanded = !isExpanded;
              });
              DraggableScrollableActuator.reset(draggableSheetContext);
            }
          }
        },
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 5.0,
        splashColor: Color(0xFF69F0AE),
        child: isExpanded
            ? Icon(Icons.keyboard_arrow_down)
            : Icon(Icons.keyboard_arrow_up),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  DraggableScrollableSheet _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      key: Key(initialExtent.toString()),
      initialChildSize: initialExtent,
      minChildSize: minExtent,
      maxChildSize: maxExtent,
      builder: (BuildContext context, ScrollController scrollController) {
        draggableSheetContext = context;
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              new BoxShadow(
                blurRadius: 10.0,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: _countryDetails.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildCard(index);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildCard(int index) {
    int length = _countryDetails[index]["name"].length;
    String fullName = _countryDetails[index]["name"];
    String name = "";
    for (int x = 0; x < length; x++) {
      if ((fullName[x] != "(") && (name.length <= 25)) {
        name += fullName[x];
      } else {
        if (name.length > 25) {
          name += " :";
        }
        break;
      }
    }

    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(index, _countryDetails)));
        },
        child: Container(
          height: 250.0,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        new BoxShadow(
                          blurRadius: 10.0,
                          spreadRadius: 3.0,
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width - 40,
                    height: 200.0,
                    child: Hero(
                      tag: _countryDetails[index]["name"],
                      child: SvgPicture.network(
                        _countryDetails[index]["flag"],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                      shadows: [
                        new Shadow(
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
