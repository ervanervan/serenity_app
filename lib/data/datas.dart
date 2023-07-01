// tipe data list CardItemData
import 'dart:convert';
import 'package:http/http.dart' as http;
// DataPlace class
class DataPlace {
  final String id;
  final String image;
  final String title;
  final String location;
  final String description;
  final String urlmap;
  final String category;
  final dynamic jumlah; // Change the type to String

  DataPlace({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.location,
    required this.urlmap,
    required this.category,
    required this.jumlah,
  });
}

// fetchData function
Future<List<DataPlace>> fetchData() async {
  final response = await http.get(Uri.parse('https://spotless-duck-shorts.cyclic.app/places'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);

    if (jsonData['message'] == 'success get all data') {
      final dataJson = jsonData['data'];

      if (dataJson is List) {
        List<DataPlace> data = [];

        for (var item in dataJson) {
          DataPlace place = DataPlace(
            id: item['_id'],
            title: item['title'],
            location: item['location'],
            description: item['description'],
            image: item['image'],
            urlmap: item['urlmap'],
            jumlah: item['jumlah'], // Assign as string
            category: item['category']
          );
          data.add(place);
        }

        return data;
      } else {
        throw Exception('Invalid data format');
      }
    } else {
      throw Exception('Failed to fetch data: ${jsonData['message']}');
    }
  } else {
    throw Exception('Failed to fetch data');
  }
}
