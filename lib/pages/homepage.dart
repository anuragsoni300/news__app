import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news__app/tabs/cardlist.dart';
import 'package:news__app/tabs/search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tab = [
    CardList(),
    Search(),
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
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: BottomNavigationBar(
                        currentIndex: _currentIndex,
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        type: BottomNavigationBarType.fixed,
                        items: [
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.receipt,
                              color: Colors.black,
                              size: 30,
                            ),
                            title: Text(
                              'news',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 0),
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 35,
                            ),
                            title: Text(
                              'search',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 0),
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.settings,
                              color: Colors.black,
                              size: 35,
                            ),
                            title: Text(
                              'setting',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 0),
                            ),
                          ),
                        ],
                        onTap: (index) {
                          setState(
                            () {
                              _currentIndex = index;
                            },
                          );
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
