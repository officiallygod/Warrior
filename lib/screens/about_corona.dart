import 'package:flutter/material.dart';
import 'package:warrior/widgets/app_bar.dart';

class AboutCorona extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBarNew(),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: mediaQuery.size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45.0),
                    bottomRight: Radius.circular(45.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 55.0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: FittedBox(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Covid-19',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 26.0,
                              letterSpacing: 1.1,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            'Symptoms',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32.0,
                              fontFamily: 'Nunito',
                              letterSpacing: 1.3,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(
                                height: 4.0,
                                width: 180.0,
                                decoration: BoxDecoration(
                                  color: Colors.purpleAccent,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              Container(
                                height: 4.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'These symptoms may \nappear 2-14 days after exposure.',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 160.0,
                        width: 160.0,
                        child: Image(
                          image: AssetImage('assets/images/patient.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _generateCards(
                          'Sore Throat',
                          'The severity of COVID-19 symptoms can range from very mild to severe.',
                          AssetImage('assets/images/sorethroat.jpg'),
                        ),
                      ),
                      Expanded(
                          child: _generateCards(
                        'Severe Cough',
                        'It appears to spread from person to person among those in close contact.',
                        AssetImage('assets/images/cough.jpg'),
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: _generateCards(
                        'High Fever',
                        'People who are older or have existing chronic medical conditions such as heart or lung disease.',
                        AssetImage('assets/images/fever.jpg'),
                      )),
                      Expanded(
                          child: _generateCards(
                        'Breathlessness',
                        'Excited or tense, often to the point of holding the breath, If you can\'t hold it then you have it.',
                        AssetImage('assets/images/breadth.jpg'),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _generateCards(String title, String desc, AssetImage image) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.0,
          ),
          FittedBox(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20.0,
                letterSpacing: 1.1,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            desc,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              letterSpacing: 1.5,
              fontFamily: 'NunitoSans',
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image(
              height: 150,
              width: 120,
              image: image,
            ),
          )
        ],
      ),
    );
  }
}
