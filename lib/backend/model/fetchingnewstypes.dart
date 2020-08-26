import 'package:flutter/rendering.dart';
import 'package:news__app/backend/model/newstypesmodel.dart';

List<NewsTypes> getnewstypes() {
  List<NewsTypes> newstypes = new List<NewsTypes>();

  NewsTypes temp = new NewsTypes();
  temp.newstype = "Business";
  temp.image = AssetImage('assets/newstypesimages/business.jpg');
  newstypes.add(temp);

  temp = new NewsTypes();
  temp.newstype = "Entertainment";
  temp.image = AssetImage('assets/newstypesimages/entertainment.jpg');
  newstypes.add(temp);

  temp = new NewsTypes();
  temp.newstype = 'General';
  temp.image = AssetImage('assets/newstypesimages/general.jpg');
  newstypes.add(temp);

  temp = new NewsTypes();
  temp.newstype = 'Health';
  temp.image = AssetImage('assets/newstypesimages/health.jpg');
  newstypes.add(temp);

  temp = new NewsTypes();
  temp.newstype = 'Science';
  temp.image = AssetImage('assets/newstypesimages/science.jpg');
  newstypes.add(temp);

  temp = new NewsTypes();
  temp.newstype = 'Sport';
  temp.image = AssetImage('assets/newstypesimages/sport.jpg');
  newstypes.add(temp);

  temp = new NewsTypes();
  temp.newstype = 'Technology';
  temp.image = AssetImage('assets/newstypesimages/technology.jpeg');
  newstypes.add(temp);

  return newstypes;
}
