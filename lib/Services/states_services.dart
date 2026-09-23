import 'dart:convert';
import 'package:covid19app/Model/world_states_model.dart';
import 'package:http/http.dart' as http;

class StatesServices {

Future<WorldStatesModel> fetchWorldStatesRecords() async {
  final response = await http.get(
    Uri.parse('https://disease.sh/v3/covid-19/all'),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    return WorldStatesModel.fromJson(data);
  } else {
    throw Exception('Failed to load COVID data');
  }
}



Future<List<dynamic>> countriesListApi() async {
  final response = await http.get(
    Uri.parse('https://disease.sh/v3/covid-19/countries'),
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data; // This is a List
  } else {
    throw Exception('Failed to load COVID data');
  }
}

}