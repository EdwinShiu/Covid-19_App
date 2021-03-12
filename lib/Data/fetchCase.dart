import 'dart:convert';
import 'package:covid19_app/Data/cases.dart';
import './caseFigures.dart';
import 'package:http/http.dart' as http;

Future<CaseApi> fetchCases() async {
  const String apiUrl = "https://api.data.gov.hk/v2/filter?q=%7B%22resource%22%3A%22http%3A%2F%2Fwww.chp.gov.hk%2Ffiles%2Fmisc%2Fenhanced_sur_covid_19_eng.csv%22%2C%22section%22%3A1%2C%22format%22%3A%22json%22%7D";

  final response = await http.get(apiUrl);

  if (response.statusCode == 200) {
    print("statusCode 200");
    CaseApi cases = CaseApi.fromJson(json.decode(response.body) as List);
    return cases;
  }
  else {
    throw Exception("Failed to load");
  }
}

Future<CaseFiguresApi> fetchCaseFigures() async {
  const String apiUrl = "https://api.data.gov.hk/v2/filter?q=%7B%22resource%22%3A%22http%3A%2F%2Fwww.chp.gov.hk%2Ffiles%2Fmisc%2Flatest_situation_of_reported_cases_covid_19_eng.csv%22%2C%22section%22%3A1%2C%22format%22%3A%22json%22%7D";

  final response = await http.get(apiUrl);

  if (response.statusCode == 200) {
    print("statusCode 200");
    CaseFiguresApi figures = CaseFiguresApi.fromJson(json.decode(response.body) as List);
    return figures;
  }
  else {
    throw Exception("Failed to load");
  }

}