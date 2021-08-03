import 'package:f_8/models/article.dart';
import 'package:f_8/screens/articleContent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customListTile(Article _articleScreen, BuildContext context) {
  var time = DateTime.parse(_articleScreen.publishedAt); // 8:18pm
  var time_by_hourse = (time.hour).toString();
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ArticleScreen(article: _articleScreen)),
      );
    },
    child: Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(7.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.deepOrangeAccent,
              image: DecorationImage(
                  image: _articleScreen.urlToImage != null
                      ? NetworkImage(_articleScreen.urlToImage)
                      : AssetImage('lib/images/default_img.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 12.0),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(3),
                width: MediaQuery.of(context).size.width / 3,
                height: 33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.purple,
                ),
                child: Center(
                  child: Text(
                    _articleScreen.source.name,
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'cairo'),
                  ),
                ),
              ),
              SizedBox(width: 150),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.timer,size: 20,),
                    Text(' ${time_by_hourse} hours'),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 4.0),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white54,
            ),
            child: Text(
              _articleScreen.title,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  fontFamily: 'cairo'),
            ),
          )
        ],
      ),
    ),
  );
}
