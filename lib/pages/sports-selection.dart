import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kampfsport_training/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SportsSelectionWidget extends StatelessWidget {

  Future<void> selectSport(String name, context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedSport', name);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomeWidget())
    );
  }

  @override
  Widget build(BuildContext context) {
    var cards = [
      SelectionCard(
        name: 'Karate',
        description: 'Der Kampfsport wo man mit den Händen haut',
        thumbnailFilename: 'karate.jpg',
      ),
      SelectionCard(
        name: 'Taekwondo',
        description: 'Der Kampfsport wo man andere ganz viel tritt',
        thumbnailFilename: 'taekwondo.jpg',
      ),
    ];

    for (var card in cards) {
      card.onSelect = this.selectSport;
    }

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Builder(
                builder: (context) => Container(
//                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider(
                    items: cards,
                    options: CarouselOptions(
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        height: MediaQuery.of(context).size.height,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        scrollDirection: Axis.horizontal),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectionCard extends StatelessWidget {
  String name, description, thumbnailFilename;
  Function onSelect = () => {};

  SelectionCard(
      {String name,
      String description,
      String thumbnailFilename,
      Function onSelect}) {
    this.name = name;
    this.description = description;
    this.thumbnailFilename = thumbnailFilename;
    this.onSelect = onSelect;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/selection/' + thumbnailFilename),
          fit: BoxFit.cover,
        ),
      ),
//      width: MediaQuery.of(context).size.width,
//      height: MediaQuery.of(context).size.height,
//      child: Expanded(
      child: Column(
        children: [
          Spacer(),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  this.name,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  this.description,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: RaisedButton(
                    onPressed: () => this.onSelect(this.name, context),
                    color: Colors.green,
                    child: Text(
                      'Auswählen',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
//      ),
    );
  }
}
