import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:morty_api/api/morty_api_entity.dart';
import 'package:morty_api/generated/json/base/json_convert_content.dart';
import 'package:morty_api/ui/screens/character_screen.dart';
import 'package:morty_api/ui/widgets/character_tile_widget.dart';

class CharactersScreen extends StatefulWidget {
  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  Future<MortyApiEntity> _getApi() async {
    Dio dio = Dio();
    final response =
        await dio.get('https://rickandmortyapi.com/api/character?page=1');
    var data = response.data;
    print(data);

    return JsonConvert.fromJsonAsT<MortyApiEntity>(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty'),
        backgroundColor: Color.fromRGBO(60, 62, 68, 1),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black87,
        child: FutureBuilder(
          future: _getApi(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            var data = snapshot.data;
            if (snapshot.hasData)
              return ListView.builder(
                itemCount: 19,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: CharacterTileWidget(
                          image: data.results[i].image,
                          gender: data.results[i].gender,
                          species: data.results[i].species,
                          status: data.results[i].status,
                          name: data.results[i].name,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CharacterScreen(data: data.results[i]),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
