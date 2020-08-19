import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news__app/tabs/cardlist.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tab = [
    CardList(),
    Center(
      child: Text('dffrg'),
    ),
    Center(
      child: Text('asdfghj'),
    ),
  ];

  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 1.0],
                colors: [
                  Color.fromRGBO(190, 120, 90, 1),
                  Color.fromRGBO(60, 209, 200, 1),
                ],
              ),
            ),
            child: tab[_currentIndex],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.black.withOpacity(0.66),
                      ),
                      child: BottomNavigationBar(
                        //selectedFontSize: 0.0,
                        currentIndex: _currentIndex,
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        type: BottomNavigationBarType.fixed,
                        items: [
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.ac_unit,
                              color: Colors.white,
                            ),
                            title: Text(
                              'data',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.ac_unit,
                              color: Colors.white,
                            ),
                            title: Text(
                              'data',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.ac_unit,
                              color: Colors.white,
                            ),
                            title: Text(
                              'data',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                        onTap: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
