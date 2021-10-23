import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vintage_games/constants/strings.dart';


class GamesList extends StatefulWidget {
  const GamesList({Key? key}) : super(key: key);

  @override
  _GamesListState createState() => _GamesListState();
}

class _GamesListState extends State<GamesList> {

  final List<Map<String, dynamic>> _gameList = [
    {"id": 1, "name": "Subway" },
    {"id": 2, "name": "Temple Run"},
    {"id": 3, "name": "Pubg"},
    {"id": 4, "name": "Candy Crush"},
    {"id": 5, "name": "Candy"},
    {"id": 6, "name": "Saaga"},
    {"id": 7, "name": "Ball Sort"},
    {"id": 8, "name": "Sorting"},
  ];

  List<Map<String, dynamic>> _foundGames = [];
  @override
  initState() {
    _foundGames = _gameList;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _gameList;
    } else {
      results = _gameList
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundGames = results;
    });
  }
  SliverAppBar topSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.greenAccent,
      expandedHeight: 300,
      floating: false,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Container(
                color: Colors.white,
                child: Image.network(
                  'https://images.ctfassets.net/hrltx12pl8hq/4plHDVeTkWuFMihxQnzBSb/aea2f06d675c3d710d095306e377382f/shutterstock_554314555_copy.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
  SliverAppBar topAppBarSearch() {
    return SliverAppBar(
      backgroundColor: Colors.greenAccent,
      pinned: true,
      title: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: const Offset(1.1, 1.1),
                blurRadius: 5.0),
          ],
        ),
        child: CupertinoTextField(
          onChanged: (value) => _runFilter(value),
          keyboardType: TextInputType.text,
          placeholder: MyStrings.searchText,
          placeholderStyle: TextStyle(
            color: Color(0xffC4C6CC),
            fontSize: 14.0,
          ),
          prefix: Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
            child: Icon(
              Icons.search,
              size: 18,
              color: Colors.black,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            topSliverAppBar(),
            topAppBarSearch()
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [

              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: _foundGames.isNotEmpty
                    ? ListView.builder(
                  itemCount: _foundGames.length,
                  itemBuilder: (context, index) => Card(
                    key: ValueKey(_foundGames[index]["id"]),
                    // color: Colors.amberAccent,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: SizedBox(),
                      title: Text(_foundGames[index]['name']),
                    ),
                  ),
                )
                    : const Text(
                  MyStrings.noResult,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}