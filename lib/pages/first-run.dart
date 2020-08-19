import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Gerrit/AndroidStudioProjects/kampfsport_training/lib/pages/sports-selection.dart';

class FirstRunWidget extends StatelessWidget {
  void begin(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SportsSelectionWidget())
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Willkommen'),
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/first-run.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      FractionallySizedBox(
                        widthFactor: 0.9,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Zuerst musst du \neine Kampfsportart auswählen',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: FlatButton(
                                    child: Text(
                                      'Los gehts!',
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                    splashColor: Colors.blueAccent,
                                    onPressed: () => begin(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
