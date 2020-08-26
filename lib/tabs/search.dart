import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news__app/backend/model/fetchingnewstypes.dart';
import 'package:news__app/backend/model/newstypesmodel.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Color _mycolor = Colors.amber;
  bool _active = true;
  TextEditingController _controller = TextEditingController();
  List<NewsTypes> newstypes = getnewstypes();

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        print(_controller.text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Container(
              child: GridView.count(
                childAspectRatio: 1.5,
                shrinkWrap: true,
                crossAxisCount: 2,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: List.generate(
                  newstypes.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 5.0,
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: newstypes[index].image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.3),
                              child: Center(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 1,
                                    sigmaY: 1,
                                  ),
                                  child: Text(
                                    newstypes[index].newstype,
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: _active ? 0 : 5, sigmaY: _active ? 0 : 5),
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: AnimatedContainer(
                height: 60,
                width: _active ? 360 : 450,
                duration: Duration(
                  milliseconds: 200,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: _mycolor.withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: !_active,
                      hintText: _active ? "Search News " : null,
                      fillColor: Colors.black.withOpacity(0.05),
                      icon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    expands: false,
                    controller: _controller,
                    onTap: () {
                      setState(() {
                        _active = !_active;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
