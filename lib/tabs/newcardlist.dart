import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news__app/backend/model/articalmodel.dart';
import 'package:news__app/browser/browserpage.dart';
import 'package:shimmer/shimmer.dart';

class NewCardList extends StatefulWidget {
  final List<ArticalModel> articals;
  NewCardList({this.articals});
  @override
  _NewCardListState createState() => _NewCardListState(articals: articals);
}

class _NewCardListState extends State<NewCardList> {
  final List<ArticalModel> articals;

  _NewCardListState({this.articals});

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
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: GestureDetector(
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: 240.0,
                                  height: 170.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: CachedNetworkImage(
                                    imageUrl: articals[index].urlToImage,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Center(
                                      child: Shimmer.fromColors(
                                        child: Container(
                                          width: 240.0,
                                          height: 170.0,
                                          color: Colors.amber,
                                        ),
                                        baseColor:
                                            Color.fromRGBO(121, 89, 74, 0.3),
                                        highlightColor:
                                            Color.fromRGBO(251, 236, 197, 0.6),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: double.infinity,
                                      height: 70.0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(articals[index].title),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: double.infinity,
                                      height: 92.0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          articals[index].description,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      itemCount: articals.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
