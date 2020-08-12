import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:warrior/models/data.dart';
import 'package:warrior/services/data_fetch.dart';
import 'package:warrior/widgets/app_bar.dart';
import 'package:warrior/widgets/stats_grid.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  int _countryGlobalIndex = 0;
  int _totalTodayIndex = 0;
  bool isLoading = true;

  final CovidData covidData = CovidData();
  Data dataToBeDisplayed;
  Map<String, Data> dataMap = {};

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  initializeData() async {
    _totalTodayIndex = 0;
    _countryGlobalIndex = 0;

    dataMap = await covidData.getCountry('IN');
    setState(() {
      dataToBeDisplayed = dataMap['total'];
      isLoading = false;
    });
  }

  void changeData(int countryGlobalIndex, int totalTodayIndex) async {
    setState(() {
      isLoading = true;
    });
    if (countryGlobalIndex == 0) {
      if (totalTodayIndex == 0) {
        dataMap = await covidData.getCountry('IN');
        setState(() {
          dataToBeDisplayed = dataMap['total'];
          isLoading = false;
        });
      } else if (totalTodayIndex == 1) {
        dataMap = await covidData.getCountryTimeline(DateFormat('MM/dd/yy')
            .format(DateTime.now().subtract(Duration(days: 1)))
            .substring(1));
        setState(() {
          dataToBeDisplayed = dataMap['today'];
          isLoading = false;
        });
      }
    } else if (countryGlobalIndex == 1) {
      setState(() {
        isLoading = true;
      });
      dataMap = await covidData.getGlobal();
      setState(() {
        dataToBeDisplayed = dataMap['total'];
        isLoading = false;
        _totalTodayIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBarNew(),
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(),
          _buildRegionTabBar(),
          _buildStatsTabBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            sliver: SliverToBoxAdapter(
              child: isLoading
                  ? Center(
                      child: SpinKitThreeBounce(
                        color: Colors.white,
                        size: 30.0,
                      ),
                    )
                  : StatsGrid(
                      dataDisplay: dataToBeDisplayed,
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () =>
                  launch("https://transformingindia.mygov.in/covid-19/"),
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
                                'More about COV-19',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Click here to know about the new Novel Corona Virus',
                                maxLines: 3,
                                softWrap: true,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15.0,
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
                    image: AssetImage('assets/images/learn-corona.png'),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Statistics',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            letterSpacing: 1.5,
            fontFamily: 'NunitoSans',
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 50.0,
              indicatorColor: Colors.white,
            ),
            labelStyle: TextStyle(
              fontSize: 19.0,
              letterSpacing: 1.5,
              fontFamily: 'NunitoSans',
              fontWeight: FontWeight.bold,
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: [
              Text('My Country'),
              Text('Global'),
            ],
            onTap: (index) {
              _countryGlobalIndex = index;
              changeData(_countryGlobalIndex, _totalTodayIndex);
            },
          ),
        ),
      ),
    );
  }

  SliverPadding _buildStatsTabBar() {
    return SliverPadding(
      padding: EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: _countryGlobalIndex == 0 ? 2 : 1,
          child: TabBar(
            indicatorColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(
              fontSize: 14.0,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              fontFamily: 'NunitoSans',
            ),
            labelColor: Colors.white,
            unselectedLabelStyle: TextStyle(
              fontSize: 14.0,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w300,
              fontFamily: 'NunitoSans',
            ),
            unselectedLabelColor: Colors.white60,
            tabs: _countryGlobalIndex == 0
                ? [Text('Total'), Text('Yesterday')]
                : [Text('Total')],
            onTap: (index) {
              _countryGlobalIndex == 1
                  ? _totalTodayIndex = 0
                  : _totalTodayIndex = index;
              changeData(_countryGlobalIndex, _totalTodayIndex);
            },
          ),
        ),
      ),
    );
  }
}
