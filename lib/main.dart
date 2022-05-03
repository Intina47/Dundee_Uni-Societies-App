// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/homepage.dart';
import 'package:flutter_application_1/screens/mysocieties.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _searchview = new TextEditingController();
  bool _activatesearch = true;
  String _query = "";

  //search initialization
  //notify the system when a search is activated
  _HomePageState() {
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        setState(() {
          _activatesearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _activatesearch = false;
          _query = _searchview.text;
        });
      }
    });
  }

  ///every time we open the app we see the homepage first///
  int pageIndex = 0;
  final pages = [
    const Homepage(),
    const Mysocietiespage(),
    const Page3(),
    // const searchPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: buildAppBar(context),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 1, 10, 26),
              ),
              child: Text(
                'Mamba_0.1',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle_outlined),
              iconColor: Colors.pink,
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.event_seat_outlined),
              iconColor: Colors.pink,
              title: Text('My Tickets'),
            ),
            ListTile(
              leading: Icon(Icons.bookmark_add),
              iconColor: Colors.pink,
              title: Text('Pinned Events'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              iconColor: Colors.pink,
              title: Text('Settings'),
            )
          ],
        ),
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 1, 10, 26),
      elevation: 9,
      actions: [
        IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => searchPage(context))),
            icon: const Icon(Icons.search))
      ],
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 2, 15, 35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Homepage Button
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home_filled,
                    color: Colors.orangeAccent,
                    size: 35,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.blueGrey,
                    size: 35,
                  ),
          ),
          //My clubs button
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.list_alt_rounded,
                    color: Colors.orange,
                    size: 35,
                  )
                : const Icon(
                    Icons.list_alt_outlined,
                    color: Colors.blueGrey,
                    size: 35,
                  ),
          ),
          //events button
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
                    Icons.event_available_rounded,
                    color: Colors.orange,
                    size: 35,
                  )
                : const Icon(
                    Icons.event_available_outlined,
                    color: Colors.blueGrey,
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }

  //our search Bar implementation

  Widget searchPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 15, 35),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Center(
            child: TextField(
              //controller: _searchview,
              cursorColor: Color.fromARGB(255, 2, 15, 35),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                prefixIconColor: Colors.orange,
                hintText: 'Search....',
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x00000000),
      child: const Center(
        child: Text(
          "Events",
          style: TextStyle(
            color: Colors.black,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
