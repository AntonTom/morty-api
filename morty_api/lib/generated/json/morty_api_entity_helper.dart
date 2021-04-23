import 'package:morty_api/api/morty_api_entity.dart';

mortyApiEntityFromJson(MortyApiEntity data, Map<String, dynamic> json) {
  if (json['info'] != null) {
    data.info = MortyApiInfo().fromJson(json['info']);
  }
  if (json['results'] != null) {
    data.results = (json['results'] as List)
        .map((v) => MortyApiResults().fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> mortyApiEntityToJson(MortyApiEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['info'] = entity.info?.toJson();
  data['results'] = entity.results?.map((v) => v.toJson())?.toList();
  return data;
}

mortyApiInfoFromJson(MortyApiInfo data, Map<String, dynamic> json) {
  if (json['count'] != null) {
    data.count = json['count'] is String
        ? int.tryParse(json['count'])
        : json['count'].toInt();
  }
  if (json['pages'] != null) {
    data.pages = json['pages'] is String
        ? int.tryParse(json['pages'])
        : json['pages'].toInt();
  }
  if (json['next'] != null) {
    data.next = json['next'].toString();
  }
  if (json['prev'] != null) {
    data.prev = json['prev'];
  }
  return data;
}

Map<String, dynamic> mortyApiInfoToJson(MortyApiInfo entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['count'] = entity.count;
  data['pages'] = entity.pages;
  data['next'] = entity.next;
  data['prev'] = entity.prev;
  return data;
}

mortyApiResultsFromJson(MortyApiResults data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id =
        json['id'] is String ? int.tryParse(json['id']) : json['id'].toInt();
  }
  if (json['name'] != null) {
    data.name = json['name'].toString();
  }
  if (json['status'] != null) {
    data.status = json['status'].toString();
  }
  if (json['species'] != null) {
    data.species = json['species'].toString();
  }
  if (json['type'] != null) {
    data.type = json['type'].toString();
  }
  if (json['gender'] != null) {
    data.gender = json['gender'].toString();
  }
  if (json['origin'] != null) {
    data.origin = MortyApiResultsOrigin().fromJson(json['origin']);
  }
  if (json['location'] != null) {
    data.location = MortyApiResultsLocation().fromJson(json['location']);
  }
  if (json['image'] != null) {
    data.image = json['image'].toString();
  }
  if (json['episode'] != null) {
    data.episode = (json['episode'] as List)
        .map((v) => v.toString())
        .toList()
        .cast<String>();
  }
  if (json['url'] != null) {
    data.url = json['url'].toString();
  }
  if (json['created'] != null) {
    data.created = json['created'].toString();
  }
  return data;
}

Map<String, dynamic> mortyApiResultsToJson(MortyApiResults entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['status'] = entity.status;
  data['species'] = entity.species;
  data['type'] = entity.type;
  data['gender'] = entity.gender;
  data['origin'] = entity.origin?.toJson();
  data['location'] = entity.location?.toJson();
  data['image'] = entity.image;
  data['episode'] = entity.episode;
  data['url'] = entity.url;
  data['created'] = entity.created;
  return data;
}

mortyApiResultsOriginFromJson(
    MortyApiResultsOrigin data, Map<String, dynamic> json) {
  if (json['name'] != null) {
    data.name = json['name'].toString();
  }
  if (json['url'] != null) {
    data.url = json['url'].toString();
  }
  return data;
}

Map<String, dynamic> mortyApiResultsOriginToJson(MortyApiResultsOrigin entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['name'] = entity.name;
  data['url'] = entity.url;
  return data;
}

mortyApiResultsLocationFromJson(
    MortyApiResultsLocation data, Map<String, dynamic> json) {
  if (json['name'] != null) {
    data.name = json['name'].toString();
  }
  if (json['url'] != null) {
    data.url = json['url'].toString();
  }
  return data;
}

Map<String, dynamic> mortyApiResultsLocationToJson(
    MortyApiResultsLocation entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['name'] = entity.name;
  data['url'] = entity.url;
  return data;
}
