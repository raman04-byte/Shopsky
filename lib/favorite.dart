import 'package:flutter/material.dart';

class MyFav extends StatefulWidget {
  const MyFav({Key? key}) : super(key: key);

  @override
  State<MyFav> createState() => _MyFavState();
}

class _MyFavState extends State<MyFav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
      Text(
        'Index 0: Cart',
        style: optionStyle,
      ),
    Text(
      'Index 1: Home',
      style: optionStyle,
    ),
    Text(
        'Index 2: My Order',style: optionStyle,)
    ,
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        shadowColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        title: const Text('Shopsky'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: () {},iconSize: 50 ,icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 4, right: 2),
            child: const Text('Sample data for the product'),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  iconSize: 150,
                  icon: Image.asset(
                    'assets/watch.jpg',
                  )),
              const Text(
                'Information about the product and ',
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(onPressed: () {},iconSize: 50, icon: const Icon(Icons.delete)),
              const Text('Delete'),
              IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              IconButton(onPressed: () {},iconSize: 50,icon: const Text('Delete')),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                iconSize: 20,
                icon: const Text('Save for later'),
              ),
              IconButton(
                onPressed: () {},
                iconSize: 20,
                icon: const Text('See more like this'),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  iconSize: 150,
                  icon: Image.asset(
                    'assets/watch.jpg',
                  )),
              const Text(
                'Information about the product',
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.fade,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(onPressed: () {},iconSize: 50, icon: const Icon(Icons.delete)),
              const Text('Delete'),
              IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              IconButton(onPressed: () {},iconSize: 50, icon: const Text('Delete')),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
          label: 'Cart',
          backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.blue,),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border),
          label: 'Order',
          backgroundColor: Colors.blue,)
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,

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
