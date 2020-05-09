import 'package:covid19/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class DetailsPage extends StatefulWidget {

  int _index;
  var _countryDetails;

  DetailsPage(int position, var details) {
    this._index = position;
    this._countryDetails = details;
  }

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  final globalkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    String _languages;
    int _languageLength = widget._countryDetails[widget._index]["languages"]
        .length;
    if (_languageLength != 0) {
      _languages =
      widget._countryDetails[widget._index]["languages"][0]["name"];
      for (int x = 1; x < _languageLength; x++) {
        if (widget._countryDetails[widget._index]["languages"][x]["name"] !=
            null) {
          _languages += " | " +
              widget._countryDetails[widget._index]["languages"][x]["name"];
        }
      }
    }
    else {
      _languages = "null";
    }

    String _currencies;
    int _cuerrenciesLength = widget._countryDetails[widget._index]["currencies"]
        .length;
    if (_cuerrenciesLength != 0) {
      _currencies =
      widget._countryDetails[widget._index]["currencies"][0]["name"];
      for (int x = 1; x < _cuerrenciesLength; x++) {
        if (widget._countryDetails[widget._index]["currencies"][x]["name"] !=
            null) {
          _currencies += " | " +
              widget._countryDetails[widget._index]["currencies"][x]["name"];
        }
      }
    }
    else {
      _currencies = "null";
    }

    String _borders;
    int _bordersLength = widget._countryDetails[widget._index]["borders"]
        .length;
    if (_bordersLength != 0) {
      _borders = widget._countryDetails[widget._index]["borders"][0];
      for (int x = 1; x < _bordersLength; x++) {
        if (widget._countryDetails[widget._index]["borders"][x] != null) {
          _borders +=
              " | " + widget._countryDetails[widget._index]["borders"][x];
        }
      }
    }
    else {
      _borders = "null";
    }

    String _timezones;
    int _timezonesLength = widget._countryDetails[widget._index]["timezones"]
        .length;
    if (_timezonesLength != 0) {
      _timezones = widget._countryDetails[widget._index]["timezones"][0];
      for (int x = 1; x < _timezonesLength; x++) {
        if (widget._countryDetails[widget._index]["timezones"][x] != null) {
          _timezones +=
              " | " + widget._countryDetails[widget._index]["timezones"][x];
        }
      }
    }
    else {
      _timezones = "null";
    }

    String _latlng;
    int _latlngLength = widget._countryDetails[widget._index]["latlng"].length;
    if (_latlngLength != 0) {
      _latlng = widget._countryDetails[widget._index]["latlng"][0].toString();
      for (int x = 1; x < _latlngLength; x++) {
        if (widget._countryDetails[widget._index]["latlng"][x] != null) {
          _latlng += " | " +
              widget._countryDetails[widget._index]["latlng"][x].toString();
        }
      }
    }
    else {
      _latlng = "null";
    }

    String _callingCodes;
    int _callingCodeLength = widget._countryDetails[widget
        ._index]["callingCodes"].length;
    if (_callingCodeLength != 0) {
      _callingCodes = widget._countryDetails[widget._index]["callingCodes"][0];
      for (int x = 1; x < _callingCodeLength; x++) {
        if (widget._countryDetails[widget._index]["callingCodes"][x] != null) {
          _callingCodes +=
              " | " + widget._countryDetails[widget._index]["callingCodes"][x];
        }
      }
    }
    else {
      _callingCodes = "null";
    }

    String _topLevelDomain;
    int _topLevelDomainLength = widget._countryDetails[widget
        ._index]["topLevelDomain"].length;
    if (_topLevelDomainLength != 0) {
      _topLevelDomain =
      widget._countryDetails[widget._index]["topLevelDomain"][0];
      for (int x = 1; x < _topLevelDomainLength; x++) {
        if (widget._countryDetails[widget._index]["topLevelDomain"][x] !=
            null) {
          _topLevelDomain += " | " +
              widget._countryDetails[widget._index]["topLevelDomain"][x];
        }
      }
    }
    else {
      _topLevelDomain = "null";
    }


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: globalkey,
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            widget._countryDetails[widget._index]["name"],
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 3.0,
              shadows: [
                new Shadow(
                  blurRadius: 1.0,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  if (widget._index < (widget._countryDetails.length - 1)) {
                    widget._index += 1;
                  }
                  else {
                    final snackBar = SnackBar(
                      backgroundColor: Colors.redAccent,
                      elevation: 2.0,
                      content: Text(
                        "This is final Country",
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
                        label: "Go Back",
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                    globalkey.currentState.showSnackBar(snackBar);
                  }
                });
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30.0),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 110.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45.0),
                  topRight: Radius.circular(45.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                  ),
                  Container(
                    child: Hero(
                      tag: widget._countryDetails[widget._index]["name"],
                      child: SvgPicture.network(
                        widget._countryDetails[widget._index]["flag"],
                        fit: BoxFit.fill,
                      ),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        new BoxShadow(
                          blurRadius: 8.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    height: 200.0,
                    width: 320.0,
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                              shadows: [
                                new Shadow(
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Text(
                              widget._countryDetails[widget._index]["name"],
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          leading: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0),
                          child: Divider(),
                        ),
                        ListTile(
                          title: Text(
                            "Native Name",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                              shadows: [
                                new Shadow(
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Text(
                              widget._countryDetails[widget
                                  ._index]["nativeName"] == null ? "" : widget
                                  ._countryDetails[widget._index]["nativeName"],
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          leading: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0),
                          child: Divider(),
                        ),
                        ListTile(
                          title: Text(
                            "Capital",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                              shadows: [
                                new Shadow(
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Text(
                              widget._countryDetails[widget
                                  ._index]["capital"] == null ? "" : widget
                                  ._countryDetails[widget._index]["capital"],
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          leading: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0),
                          child: Divider(),
                        ),
                        ListTile(
                          title: Text(
                            "Region",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                              shadows: [
                                new Shadow(
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Text(
                              widget._countryDetails[widget._index]["region"] ==
                                  null ? "" : widget._countryDetails[widget
                                  ._index]["region"],
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          leading: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0),
                          child: Divider(),
                        ),
                        ListTile(
                          title: Text(
                            "Sub Region",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                              shadows: [
                                new Shadow(
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Text(
                              widget._countryDetails[widget
                                  ._index]["subregion"] == null ? "" : widget
                                  ._countryDetails[widget._index]["subregion"],
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          leading: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0),
                          child: Divider(),
                        ),
                        ListTile(
                          title: Text(
                            "Population",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                              shadows: [
                                new Shadow(
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Text(
                              widget._countryDetails[widget
                                  ._index]["population"].toString() == null
                                  ? ""
                                  : widget._countryDetails[widget
                                  ._index]["population"].toString(),
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          leading: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0),
                          child: Divider(),
                        ),
                        ListTile(
                          title: Text(
                            "Area",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                              shadows: [
                                new Shadow(
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Text(
                              widget._countryDetails[widget._index]["area"]
                                  .toString() == null ? "" : widget
                                  ._countryDetails[widget._index]["area"]
                                  .toString(),
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          leading: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0),
                          child: Divider(),
                        ),
                        ListTile(
                          title: Text(
                            "Languages",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                              shadows: [
                                new Shadow(
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Text(
                              _languages == "null" ? "" : _languages,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          leading: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0),
                          child: Divider(),
                        ),
                        ListTile(
                          title: Text(
                            "Currencies",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                              shadows: [
                                new Shadow(
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Text(
                              _currencies == "null" ? "" : _currencies,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          leading: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0),
                          child: Divider(),
                        ),
                        ListTile(
                          title: Text(
                            "Borders",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                              shadows: [
                                new Shadow(
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Text(
                              _borders == "null" ? "" : _borders,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          leading: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0),
                          child: Divider(),
                        ),
                        ListTile(
                          title: Text(
                            "Timezones",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                              shadows: [
                                new Shadow(
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Text(
                              _timezones == "null" ? "" : _timezones,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          leading: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0),
                          child: Divider(),
                        ),
                        ListTile(
                          title: Text(
                            "Latitude Longitude",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                              shadows: [
                                new Shadow(
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Text(
                              _latlng == "null" ? "" : _latlng,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          leading: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0),
                          child: Divider(),
                        ),
                        ListTile(
                          title: Text(
                            "Calling Codes",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                              shadows: [
                                new Shadow(
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Text(
                              _callingCodes == "null" ? "" : _callingCodes,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          leading: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0),
                          child: Divider(),
                        ),
                        ListTile(
                          title: Text(
                            "Top Level Domain",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                              shadows: [
                                new Shadow(
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: Text(
                              _topLevelDomain == "null" ? "" : _topLevelDomain,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          leading: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyApp()
            ));
          },
          backgroundColor: Colors.deepPurpleAccent,
          elevation: 10.0,
          splashColor: Color(0xFF69F0AE),
          child: Icon(
            Icons.home,
          ),
        ),
      ),
    );
  }
}
