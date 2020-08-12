import 'package:flutter/material.dart';
import 'package:warrior/screens/bottom_nav_screen.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: mediaQuery.size.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Image(
                  height: mediaQuery.size.height * 0.7,
                  width: mediaQuery.size.width,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/heros.png'),
                ),
                Container(
                  height: mediaQuery.size.height * 0.3,
                  width: mediaQuery.size.width,
                ),
              ],
            ),
            Container(
              height: mediaQuery.size.height * 0.38,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45.0),
                  topRight: Radius.circular(45.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(-2, -2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Be Aware,\nStay Healthy',
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white70,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Welcome to Warrior a COVID-19 initiative',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              letterSpacing: 1.3,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BottomNavScreen(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
