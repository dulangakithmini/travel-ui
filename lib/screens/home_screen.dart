import 'package:flutter/material.dart';
import 'package:travel_ui/widgets/destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<IconData> _icons = [
    // FontAwesomeIcons.plane,
    // FontAwesomeIcons.bed,
    // FontAwesomeIcons.walking,
    // FontAwesomeIcons.biking,
    Icons.airplanemode_active,
    Icons.bed,
    Icons.nordic_walking_outlined,
    Icons.bike_scooter,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print(_selectedIndex);
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Colors.grey,

          /// half of height, in order to get a perfect circle around.
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          // color: _selectedIndex == index
          //     ? Theme.of(context).primaryColor
          //     : Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          // padding: EdgeInsets.all(40.0),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What would you like to find?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              /// Have a map instead of writing for each index in the _icons list
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // children: <Widget>[
              //   _buildIcon(0),
              //   _buildIcon(1),
              //   _buildIcon(2),
              //   _buildIcon(3),
              // ],
            ),
            SizedBox(
              height: 20.0,
            ),
            DestinationCarousel(),
          ],
        ),
      ),
    );
  }
}
