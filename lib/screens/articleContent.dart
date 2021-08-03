import 'package:f_8/models/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;

  ArticleScreen({this.article});
   //this method is used to launch the link of the article
   Future<void> _launchURL(String uri) async => await launch(article.url);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          actions: [
            TextButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            )
          ],
          title: Text(
            'Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //start
              Container(
                child: Text(
                  article.title,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 22, fontFamily: 'cairo'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    //source name
                    margin: EdgeInsets.all(6),
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(8),
                            bottomRight: Radius.circular(15))),
                    child: Text(
                      '${article.source.name}',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                //image
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: article.urlToImage != null
                          ? NetworkImage(article.urlToImage)
                          : AssetImage('lib/images/default_img.png'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                child: Column(children: [
                  IntrinsicWidth(
                    child: Column(
                      children: [
                        Text(
                          article.description ?? article.title,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'cairo',
                          ),
                        ),
                      ],
                    ), //description
                  )
                ]),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 1,
                color: Colors.deepPurple,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Published At :",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            DateTime.parse(article.publishedAt).year.toString(),
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text('/'),
                          Text(
                            DateTime.parse(article.publishedAt)
                                .month
                                .toString(),
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text('/'),
                          Text(
                            DateTime.parse(article.publishedAt).day.toString(),
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.deepPurple,
                    ),
                    child: GestureDetector(
                      onTap: () => _launchURL(article.url),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sources & Details',
                              style: TextStyle(
                                  fontFamily: 'cairo',
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
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
        ),
      ),
    );
  }
}
