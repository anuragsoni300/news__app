import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news__app/backend/model/articalmodel.dart';
import 'package:news__app/backend/model/fetchingnewstypes.dart';
import 'package:news__app/backend/model/newstypesmodel.dart';

import 'newcardlist.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> newstype = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sport",
    "technology"
  ];
  List<ArticalModel> articals = [];
  int currentindex = 0;
  final key = GlobalKey<FormState>();
  Color _mycolor = Colors.amber;
  bool _active = true;
  TextEditingController _controller = TextEditingController();
  List<NewsTypes> newstypes = getnewstypes();

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
            padding: const EdgeInsets.only(top: 120),
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
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentindex = index;
                          print(newstype[currentindex]);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => NewCardList(
                                text: newstype[currentindex],
                              ),
                            ),
                          );
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: newstypes[index].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black.withOpacity(0.3),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
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
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
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
              padding: const EdgeInsets.only(top: 50, left: 18),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: AnimatedContainer(
                      height: 60,
                      width: _active
                          ? MediaQuery.of(context).size.width * 0.6
                          : MediaQuery.of(context).size.width * 0.8,
                      duration: Duration(
                        milliseconds: 180,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: _mycolor.withOpacity(0.5),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 5, right: 10),
                        child: Form(
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
                            onChanged: (String text) {
                              setState(() {
                                text = _controller.text;
                              });
                            },
                            onTap: () {
                              setState(() {
                                _active = !_active;
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);

                                if (_active) {
                                  currentFocus.unfocus();
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.transparent,
                        highlightElevation: 0.0,
                        highlightColor: Colors.transparent,
                        elevation: 0.0,
                        splashColor: Colors.transparent,
                        child: Icon(
                          Icons.arrow_forward_ios,
                        ),
                        onPressed: () {
                          setState(() {
                            print(_controller.text);
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => NewCardList(
                                text: _controller.text,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
