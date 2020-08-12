import 'package:flutter/material.dart';
import 'package:warrior/models/data.dart';

class StatsGrid extends StatelessWidget {
  final Data dataDisplay;

  StatsGrid({@required this.dataDisplay});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      height: mediaQuery.size.height * 0.25,
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                _buildStateCard(
                    'Total Cases', dataDisplay.totalCases, Colors.orange),
                _buildStateCard('Deaths', dataDisplay.deaths, Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStateCard(
                    'Recovered', dataDisplay.recovered, Colors.green),
                _buildStateCard('Active', dataDisplay.active, Colors.lightBlue),
                _buildStateCard(
                    'Critical', dataDisplay.critical, Colors.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStateCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                letterSpacing: 1.6,
                fontFamily: 'NunitoSans',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                letterSpacing: 1.5,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
