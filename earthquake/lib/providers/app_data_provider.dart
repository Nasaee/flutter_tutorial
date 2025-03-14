import 'package:earthquake/models/earthquake_model.dart';
import 'package:earthquake/utils/helper_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AppDataProvider extends ChangeNotifier {
  final baseUrl = Uri.parse('https://earthquake.usgs.gov/fdsnws/event/1/query');
  Map<String, dynamic> queryParams = {};

  double _maxRadiusKm = 500;
  double _latitude = 0.0, _longitude = 0.0;
  String _startTime = '', _endTime = '';
  String _orderBy = 'time';
  String? _currentCity;
  final double _maxRadiusKmThreshold = 20001.6;
  bool _shouldUseLocation = false;
  EarthquakeModel? earthquakeModel;

  double get maxRadiusKm => _maxRadiusKm;
  double get latitude => _latitude;
  double get longitude => _longitude;
  String get startTime => _startTime;
  String get endTime => _endTime;
  String get orderBy => _orderBy;
  String? get currentCity => _currentCity;
  double get maxRadiusKmThreshold => _maxRadiusKmThreshold;
  bool get shouldUseLocation => _shouldUseLocation;

  _setQueryParams() {
    queryParams['format'] = 'geojson';
    queryParams['starttime'] = _startTime;
    queryParams['endtime'] = _endTime;
    queryParams['minmagnitude'] = '4';
    queryParams['orderby'] = _orderBy;
    queryParams['limit'] = '500';
    queryParams['latitude'] = _latitude.toString();
    queryParams['longitude'] = _longitude.toString();
    queryParams['maxradiuskm'] = _maxRadiusKm.toString();
  }

  init() {
    _startTime = getFormattedDateTime(
      DateTime.now()
          .subtract(const Duration(days: 1))
          .millisecondsSinceEpoch, // 1 day ago
    );
    _endTime = getFormattedDateTime(DateTime.now().millisecondsSinceEpoch);
    _maxRadiusKm = maxRadiusKmThreshold;
    _setQueryParams();
    getEarthquakeData();
  }

  Future<void> getEarthquakeData() async {
    /*
    authority: earthquake.usgs.gov (not include https://)
    path: /fdsnws/event/1/query
    queryParameters: {
      format: geojson,
      starttime: 2021-10-01,
      endtime: 2021-10-02,
      minmagnitude: 4,
      orderby: time,
      limit: 500,
      latitude: 0.0,
      longitude: 0.0,
      maxradiuskm: 500
    }
    */
    final uri = Uri.https(baseUrl.authority, baseUrl.path, queryParams);
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        earthquakeModel = EarthquakeModel.fromJson(response.body);
        print(earthquakeModel?.features?.length);
        notifyListeners();
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
