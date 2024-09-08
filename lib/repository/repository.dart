import 'package:boxigo_sample_app/model/sample_data.dart';
import 'package:dio/dio.dart';

class Repository {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://test.api.boxigo.in/sample-data/';

  Future<SampleData> fetchSampleData() async {
    try {
      final response = await _dio.get(_baseUrl);

      if (response.statusCode == 200) {
        SampleData sampleData = SampleData.fromJson(response.data);

        return sampleData;
      } else {
        throw Exception('Failed to load sample data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
