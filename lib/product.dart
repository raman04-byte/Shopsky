import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({Key? key}) : super(key: key);

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
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
      'Index 2: My Order',
      style: optionStyle,
    ),
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
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/shopsky.png',//height : 30, width: 50
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
            Container(
              padding: const EdgeInsets.only(left: 4, right: 2),
              child:(
                  const Text('Description of the product')
              ),

            ),
          const SizedBox(
              height: 10,
            ),
            CarouselSlider(

              height: 180,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 2500),
              viewportFraction: 0.8,
              items: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/laptop.jpg'),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/watch.jpg'),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/watch1.jpg'),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: const Align(
                  alignment: Alignment.topLeft, child: Text('Variants')),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    iconSize: 100,
                    icon: Image.asset('assets/watch1.jpg')),
                IconButton(
                    onPressed: () {},
                    iconSize: 100,
                    icon: Image.asset('assets/watch1.jpg')),
                IconButton(
                    onPressed: () {},
                    iconSize: 100,
                    icon: Image.asset('assets/laptop.jpg')),
              ],
            ),
           const SizedBox(
              height: 10,
            ),

          ],
        ),

      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Order',
            backgroundColor: Colors.blue,
          )
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
