import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:warrior/widgets/app_bar.dart';
import 'package:warrior/widgets/main_screen_header.dart';
import 'package:warrior/widgets/wear_essentials.dart';

class MainDefaultScreen extends StatefulWidget {
  @override
  _MainDefaultScreenState createState() => _MainDefaultScreenState();
}

class _MainDefaultScreenState extends State<MainDefaultScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBarNew(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainScreenHeader(),
            SizedBox(
              height: mediaQuery.size.height * 0.03,
            ),
            WearEssentials(),
            GestureDetector(
              onTap: () => launch("https://www.mygov.in/covid-19"),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: mediaQuery.size.height * 0.17,
                          width: 180.0,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Do your own Test!',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Follow the instructions to do your own test',
                                maxLines: 3,
                                softWrap: true,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Image(
                    height: mediaQuery.size.height * 0.28,
                    width: mediaQuery.size.height * 0.28,
                    image:
                        AssetImage('assets/images/self_assesment_corona.png'),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
