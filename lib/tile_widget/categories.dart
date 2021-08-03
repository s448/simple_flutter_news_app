import 'package:flutter/material.dart';
class CategoryCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height:90,
      margin: EdgeInsets.all(15),
      child:Row(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 180,
                  child: Column(
                    children: [
                      Icon(Icons.sports_baseball),
                      Text("Sports")
                    ],
                  ),
                ),
                Container(
                  width: 180,
                  child: Column(
                    children: [
                      Icon(Icons.sports_baseball),
                      Text("Sports")
                    ],
                  ),
                ),
                Container(
                  width: 180,
                  child: Column(
                    children: [
                      Icon(Icons.sports_baseball),
                      Text("Sports")
                    ],
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