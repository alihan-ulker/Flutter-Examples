import 'package:flutter_bloc_example_3/repository/home/model/home_card_model.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<HomeCardModel?> getHomeCard() async {
    const String baseUrl = "https://api.npoint.io/f7087cb6b8fde7852de9";

    var url = Uri.parse(baseUrl);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return homeCardModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
