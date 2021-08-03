import 'package:f_8/api_services/api.dart';
import 'package:f_8/tile_widget/customListTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/article.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(fontFamily: 'cairo'),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  api_services client = api_services();

  @override
  void initState() {
    client.getArticle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'News ',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  TextSpan(
                    text: 'Hub ',
                    style: TextStyle(fontSize: 22, color: Colors.redAccent),
                  )
                ],
              ),
            ),
          ),
        ),
        //Now let's call the APi services with future builder widget
        body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            //Check if there is a data to view or not
            if (snapshot.hasData) {
              //if true => make the list of these data
              List<Article> articles = snapshot.data;
              return ListView.builder(
                //Now let's create our custom List tile
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context),
              );
              //if there is no data view a snackBar to show the error
            } else if (snapshot.hasError) {
              return SnackBar(
                content: Text('Error While Fetching data'),
              );
            }
            //While the future is running => show the CircularProgressIndicator
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
