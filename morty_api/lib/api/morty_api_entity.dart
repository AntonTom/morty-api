import 'package:morty_api/generated/json/base/json_convert_content.dart';

class MortyApiEntity with JsonConvert<MortyApiEntity> {
  MortyApiInfo info;
  List<MortyApiResults> results;
}

class MortyApiInfo with JsonConvert<MortyApiInfo> {
  int count;
  int pages;
  String next;
  dynamic prev;
}

class MortyApiResults with JsonConvert<MortyApiResults> {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  MortyApiResultsOrigin origin;
  MortyApiResultsLocation location;
  String image;
  List<String> episode;
  String url;
  String created;
}

class MortyApiResultsOrigin with JsonConvert<MortyApiResultsOrigin> {
  String name;
  String url;
}

class MortyApiResultsLocation with JsonConvert<MortyApiResultsLocation> {
  String name;
  String url;
}
