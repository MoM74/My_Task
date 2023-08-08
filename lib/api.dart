import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = 'Bx0mB2t21Ppr_I2W185hQM22mTRBU6uT9iWmWR6SKmo';

Future<List<String>> getImages() async {
  final response = await http.get(
    Uri.parse('https://api.unsplash.com/photos/?client_id=$apiKey'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> responseData = json.decode(response.body);
    return responseData.map<String>((item) => item['urls']['small']).toList();
  } else {
    throw Exception('Failed to load images');
  }
}
