import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchView> {
  final _searchEdit = new TextEditingController();

  bool _isSearch = true;
  String _searchText = "";

  List<String> _recipeListItems;
  List<String> _cuisineListItems;

  @override
  void initState() {
    super.initState();
    _cuisineListItems = new List<String>();
    _cuisineListItems = [
      "Poland",
      "Italy",
      "Germany"
    //  pobrać wszystkie kuchnie
    ];
    _cuisineListItems.sort();

    _recipeListItems = new List<String>();
    _recipeListItems = [
      //  pobrać wszystkie nazwy potraw

    ];
    _recipeListItems.sort();
  }

  _SearchScreenState() {
    _searchEdit.addListener(() {
      if (_searchEdit.text.isEmpty) {
        setState(() {
          _isSearch = true;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearch = false;
          _searchText = _searchEdit.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Search For Recipe"),
      ),
      body: new Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: new Column(
          children: <Widget>[
            _searchBox(),
            _isSearch ? _listView() : _searchListView()
          ],
        ),
      ),
    );
  }

  Widget _searchBox() {
    return new Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: new TextField(
        controller: _searchEdit,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: new TextStyle(color: Colors.grey[300]),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _listView() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: _recipeListItems.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: Colors.cyan[50],
              elevation: 5.0,
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: new Text("${_recipeListItems[index]}"),
              ),
            );
          }),
    );
  }

  Widget _searchListView() {
    _recipeListItems = new List<String>();
    for (int i = 0; i < _recipeListItems.length; i++) {
      var item = _recipeListItems[i];

      if (item.toLowerCase().contains(_searchText.toLowerCase())) {
        _recipeListItems.add(item);
      }
    }
    return _searchAddList();
  }

  Widget _searchAddList() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: _recipeListItems.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: Colors.cyan[100],
              elevation: 5.0,
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: new Text("${_recipeListItems[index]}"),
              ),
            );
          }),
    );
  }
}