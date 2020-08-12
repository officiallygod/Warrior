import 'package:intl/intl.dart';
import 'package:warrior/models/data.dart';
import 'package:warrior/services/networking.dart';

class CovidData {
  Map<String, Data> dataMap = {};

  Future<Map<String, Data>> getGlobal() async {
    var globalTotalDataUrl =
        'https://api.thevirustracker.com/free-api?global=stats';
    NetworkHelper networkHelper = NetworkHelper(globalTotalDataUrl);
    var globalTotalData = await networkHelper.getData();

    var format = NumberFormat.compact(locale: 'en_US');

    return dataMap = {
      'total': Data(
        totalCases: format
            .format(globalTotalData['results'][0]['total_cases'])
            .toString(),
        deaths: format
            .format(globalTotalData['results'][0]['total_deaths'])
            .toString(),
        recovered: format
            .format(globalTotalData['results'][0]['total_recovered'])
            .toString(),
        active: format
            .format(globalTotalData['results'][0]['total_active_cases'])
            .toString(),
        critical: format
            .format(globalTotalData['results'][0]['total_serious_cases'])
            .toString(),
        dateTime: '',
      ),
    };
  }

  Future<Map<String, Data>> getCountry(String country) async {
    var countryTotalDataUrl =
        'https://api.thevirustracker.com/free-api?countryTotal=IN';
    NetworkHelper networkHelper = NetworkHelper(countryTotalDataUrl);
    var countryTotalData = await networkHelper.getData();

    var format = NumberFormat.compact(locale: 'en_US');

    return dataMap = {
      'total': Data(
        totalCases: format
            .format(countryTotalData['countrydata'][0]['total_cases'])
            .toString(),
        deaths: format
            .format(countryTotalData['countrydata'][0]['total_deaths'])
            .toString(),
        recovered: format
            .format(countryTotalData['countrydata'][0]['total_recovered'])
            .toString(),
        active: format
            .format(countryTotalData['countrydata'][0]['total_active_cases'])
            .toString(),
        critical: format
            .format(countryTotalData['countrydata'][0]['total_serious_cases'])
            .toString(),
        dateTime: '',
      ),
      'today': Data(
        totalCases: '0 M',
        deaths: '0 K',
        recovered: '0 K',
        active: '0 M',
        critical: '0 M',
        dateTime: '',
      ),
    };
  }

  Future<Map<String, Data>> getCountryTimeline(String date) async {
    var countryTimelineDataUrl =
        'https://api.thevirustracker.com/free-api?countryTimeline=IN';
    NetworkHelper networkHelper = NetworkHelper(countryTimelineDataUrl);
    var countryTimelineData = await networkHelper.getData();

    var format = NumberFormat.compact(locale: 'en_US');

    return dataMap = {
      'total': Data(
        totalCases: '0 M',
        deaths: '0 K',
        recovered: '0 K',
        active: '0 M',
        critical: '0 M',
        dateTime: '',
      ),
      'today': Data(
        totalCases: format
            .format(countryTimelineData['timelineitems'][0][date]
                ['new_daily_cases'])
            .toString(),
        deaths: format
            .format(countryTimelineData['timelineitems'][0][date]
                ['new_daily_deaths'])
            .toString(),
        recovered: 'N/A',
        active: 'N/A',
        critical: 'N/A',
        dateTime: '',
      ),
    };
  }
}
