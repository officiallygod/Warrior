import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warrior/widgets/app_bar.dart';

class InfoScreen extends StatelessWidget {
  final List<String> imagesName = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
    'assets/images/7.png',
    'assets/images/8.png',
    'assets/images/9.png',
    'assets/images/10.png',
    'assets/images/11.png',
    'assets/images/12.jpg',
    'assets/images/13.png',
    'assets/images/14.png',
    'assets/images/15.png',
    'assets/images/16.png',
    'assets/images/17.png',
    'assets/images/18.png',
    'assets/images/19.png',
    'assets/images/20.png',
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBarNew(),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          Expanded(
            child: ListView.builder(
              itemCount: imagesName.length,
              itemBuilder: (BuildContext context, int index) {
                return _imageHolder(
                    Image(
                      image: AssetImage(imagesName[index]),
                    ),
                    mediaQuery);
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        'Mythbusters',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 40.0,
          letterSpacing: 1.5,
          fontFamily: 'NunitoSans',
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Container _imageHolder(Image image, MediaQueryData mediaQuery) {
    return Container(
      margin: EdgeInsets.all(13.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(
          color: Colors.white,
          style: BorderStyle.solid,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: image,
      ),
    );
  }
}
