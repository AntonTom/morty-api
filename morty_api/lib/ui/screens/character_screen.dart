import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:morty_api/api/morty_api_entity.dart';
import 'package:morty_api/generated/json/base/json_convert_content.dart';

class CharacterScreen extends StatelessWidget {
  final MortyApiResults data;

  const CharacterScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(60, 62, 68, 1),
        centerTitle: true,
        title: Text(data.name),
      ),
      body: Container(
        color: Colors.black87,
        child: Column(
          children: [
            const SizedBox(
              height: 27,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    data.image,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 13,
                  height: 13,
                  decoration: BoxDecoration(
                    color: data.status == 'Alive'
                        ? Color.fromRGBO(0, 196, 140, 1)
                        : Colors.red,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "${data.status} - ${data.species}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Origin Location',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${data.origin.name}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 1.5,
                    color: Color.fromRGBO(255, 255, 255, 0.2),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Gender',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${data.gender}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 1.5,
                    color: Color.fromRGBO(255, 255, 255, 0.2),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    'Location',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${data.location.name}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
