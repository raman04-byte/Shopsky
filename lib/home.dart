import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        shadowColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        title: const Text('Shopsky'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
            icon: const Icon(Icons.search),
            iconSize: 35,
          ),
          IconButton(
              onPressed: () {},
              iconSize: 35,
              icon: const Icon(Icons.shopping_cart))
        ],
      ),drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/shopsky.png', //height : 30, width: 50
                ),
              ),
              color: Colors.blue,
            ),
            child: Text('Shopsky'),
          ),
          ListTile(
            title: const Text('My Account'),
            leading: const Icon(Icons.account_circle_rounded),
            onTap: () {},
          ),
          ListTile(
            title: const Text('My Order'),
            onTap: () {},
            leading: const Icon(Icons.bookmark_border),
          ),
          ListTile(
            title: const Text('My cart'),
            onTap: () {},
            leading: const Icon(Icons.shopping_cart),
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {},
            leading: const Icon(Icons.settings),
          )
        ],
      ),
    ),
      body: SingleChildScrollView(
       child: Column(
         children: [

         ],
       ),
      ),
      );
  }
}
class DataSearch extends SearchDelegate {
  final List<String> searchTerms = [
    'Laptops',
    'Mobile',
    'Desktop',
    'Mouse',
    'Bottle',
    'Keyboard'
  ];
  final recentTerms = [
    'Desktop',
    'Mouse',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SizedBox(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.transparent,
          child: Center(
            child: Text(query),
          ),
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? searchTerms
        : recentTerms.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: const Icon(Icons.search_sharp),
        title: Text(searchTerms[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}
