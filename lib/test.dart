import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class test extends StatefulWidget {
  test({Key key}) : super(key: key);

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  getData() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListView(
                      children: [
                        Container(
                          child: Text(snapshot.data[i]['body'].toString()),
                        ),
                      ],
                    ),
                  );
                });
          }
          return CircularProgressIndicator();
        });
  }
}
