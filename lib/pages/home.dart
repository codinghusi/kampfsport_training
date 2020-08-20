import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeWidget extends StatelessWidget {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Startseite'),
        ),
        body: FutureBuilder(
          builder: (BuildContext context,
              AsyncSnapshot<SharedPreferences> snapshot) {
            if (snapshot.hasData) {
              final prefs = snapshot.data;
              String selectedSport =
                  prefs.getString('selectedSport') ?? 'Errroorr';

              return Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text('ausgewählter Sport: ' + selectedSport),
                  ],
                ),
              );
            }
            return Text('Gib et nicht');
          },
        ),
      ),
    );
  }
}
