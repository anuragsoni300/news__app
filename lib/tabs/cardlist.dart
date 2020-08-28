import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news__app/backend/fetching/fetchingfromarticalmodel.dart';
import 'package:news__app/backend/model/articalmodel.dart';
import 'package:news__app/browser/browserpage.dart';
import 'package:shimmer/shimmer.dart';

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  List<ArticalModel> articals = [];
  bool _loading = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&apiKey="+YOUR_API_KEY;
    newsClass.urls = url;
    await newsClass.getNews(newsClass.urls);
    articals = newsClass.news;
    if (this.mounted) {
      setState(() {
        _loading = !_loading;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: articals.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 40),
          child: Container(
            height: 300,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              color: Colors.transparent,
              child: Stack(
                alignment: Alignment.topRight,
                overflow: Overflow.clip,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: Card(
                      margin: EdgeInsets.all(0),
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: articals[index].urlToImage,
                        placeholder: (context, url) => Center(
                          child: Shimmer.fromColors(
                            child: Container(
                              height: 300,
                              color: Colors.amber,
                            ),
                            baseColor: Color.fromRGBO(121, 89, 74, 0.3),
                            highlightColor: Color.fromRGBO(251, 236, 197, 0.6),
                          ),
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(15)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15)),
                            color: Color.fromRGBO(8, 152, 200, 0.2),
                          ),
                          //height: 106,
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, bottom: 3, right: 3),
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Text(
                                  articals[index].title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(15)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          height: 192,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15)),
                            color: Color.fromRGBO(8, 152, 200, 0.2),
                          ),
                          //height: 200,
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Container(
                                    height: 120,
                                    child: Text(
                                      articals[index].description,
                                      style: TextStyle(color: Colors.white),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, left: 25.0, right: 25.0),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: InkWell(
                                    child: Card(
                                      elevation: 10.0,
                                      color: Colors.tealAccent.withOpacity(1.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, right: 15.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Icon(Icons.arrow_forward_ios),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => BrowserPage(
                                            url: articals[index].url,
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
