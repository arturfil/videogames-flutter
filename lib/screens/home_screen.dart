import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'add_videogame_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // PageController _pageController
  List data; // TODO: change to videogames to make it more legible

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("http://127.0.0.1:5000/api/videogame/videogames"),
        headers: {
          "Accept": "application/json",
          // "token": "Bearer your token"
        });

    //TODO: figure out how to request a picture of a single videogame

    this.setState(() {
      data = json.decode(response.body);
    });

    print(response.body);

    return "Success";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AddVideoGameScreen(),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Video Games App"),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              width: 200.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(
                      'http://localhost:5000/api/videogame/photo/${data[index]["_id"]}',
                    ),
                    Text(
                      data[index]["name"],
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(data[index]["description"]),
                    // Image(image: NetworkImage(data[index]["photo"][data]),),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
