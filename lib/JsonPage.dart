import 'dart:convert';
import 'package:flutter/material.dart';

// TODO: DELETE THIS FILE (!!!!!)

class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List of recipes"),),
      body: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString("assets/recipes.json"),
          builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done) {
            var showData=json.decode(snapshot.data.toString());

            return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(showData[index]['cuisine']),
                    subtitle: Text(showData[index]['name']),
                  );
                },

            itemCount: showData.length);
          } else {
            return CircularProgressIndicator();
          }
        },
        ),
      ),

    );
  }
}