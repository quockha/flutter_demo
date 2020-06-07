//LISTVIEW CUSTOM COLOR BACKGOUB
import 'package:flutter/material.dart';

class design_color_cricir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(), title: 'Devotion', theme: appTheme,
    );
  }
}

ThemeData appTheme = ThemeData(
  fontFamily: 'Oxygen',
  primaryColor: Colors.purpleAccent,
);

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Devotion'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          CurvedListItem(
            title: 'Yoga and Meditation for Beginners',
            time: 'TODAY 5:30 PM',
            color: Colors.red,
            nextColor: Colors.green,
          ),
          CurvedListItem(
            title: 'Practice French, English And Chinese',
            time: 'TUESDAY 5:30 PM',
            color: Colors.green,
            nextColor: Colors.yellow,
          ),
          CurvedListItem(
            title: 'Adobe XD Live Event in Europe',
            time: 'FRIDAY 6:00 PM',
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

class CurvedListItem extends StatelessWidget {
  const CurvedListItem({
    this.title,
    this.time,
    this.icon,
    this.people,
    this.color,
    this.nextColor,
  });

  final String title;
  final String time;
  final String people;
  final IconData icon;
  final Color color;
  final Color nextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: nextColor,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(80.0),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 32,
          top: 35.0,
          bottom: 50,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                time,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Row(),
            ]),
      ),
    );
  }
}