//import 'dart:ffi';
//import 'dart:html';

import 'package:drawer/gerer_post.dart';
import 'package:drawer/home.dart';
import 'package:drawer/poster.dart';
import 'package:drawer/profile.dart';
import 'package:drawer/settings.dart';
import 'package:drawer/listelogement.dart';
import 'package:flutter/material.dart';

void main() => runApp(LocalSpace());

class LocalSpace extends StatefulWidget {
  @override
  _LocalSpaceState createState() => _LocalSpaceState();
}

class _LocalSpaceState extends State<LocalSpace> {
  int index = 0;
  List<Widget> list = [
    Home(),
    Listelogement(),
    Poster(),
    GererPost(),
    Profile(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff55C9EA),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('LocalSpace'),
          actions: <Widget>[
            new Icon(Icons.place),
            Padding(padding: EdgeInsets.all(2.0)),
          ],
        ),
        body: list[index],
        drawer: MyDrawer(onTap: (ctx, i) {
          setState(() {
            index = i;
            Navigator.pop(ctx);
          });
        }),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function onTap;

  MyDrawer({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Color(0xff55C9EA)),
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        child: CircleAvatar(
                          //backgroundColor: Colors.amber,
                          backgroundImage: AssetImage("images/avatar.png"),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Alfred Valdes',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'mirdo2co@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //ListTile(
              //  leading: IconButton(
              //    icon: Icon(Icons.search),
              //    color: Color(0xff55C9EA),
              //    onPressed: () {
              //      showSearch(context: context, delegate: DataSearch());
              //    },
              //  ),
              //  title: Text('Search'),
              //  onTap: () => onTap(context, 0),
              //),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.search),
                  color: Color(0xff55C9EA),
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                ),
                title: Text('Search'),
                onTap: () =>
                    onTap(showSearch(context: context, delegate: DataSearch())),
              ),
              Divider(color: Colors.grey[200]),
              const SizedBox(height: 10),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Color(0xff55C9EA),
                ),
                title: Text('Home'),
                onTap: () => onTap(context, 0),
              ),
              ListTile(
                leading: Icon(
                  Icons.place,
                  color: Color(0xff55C9EA),
                ),
                title: Text('Locate'),
                onTap: () => onTap(context, 0),
              ),
              ListTile(
                leading: Icon(
                  Icons.location_city,
                  color: Color(0xff55C9EA),
                ),
                title: Text('Liste de logements'),
                onTap: () => onTap(context, 1),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey[200]),
              ListTile(
                leading: Icon(
                  Icons.maps_home_work,
                  color: Color(0xff55C9EA),
                ),
                title: Text('Poster une annonce'),
                onTap: () => onTap(context, 2),
              ),
              ListTile(
                leading: Icon(
                  Icons.folder_special,
                  color: Color(0xff55C9EA),
                ),
                title: Text('Gérer mes posts'),
                onTap: () => onTap(context, 3),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey[200]),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Color(0xff55C9EA),
                ),
                title: Text('Profile'),
                onTap: () => onTap(context, 4),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Color(0xff55C9EA),
                ),
                title: Text('Settings'),
                onTap: () => onTap(context, 5),
              ),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Color(0xff55C9EA),
                ),
                title: Text('Logout'),
                onTap: () => onTap(context, 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "Etoudi",
    "Awae Escalier",
    "Dragage",
    "Essos",
    "Nkolmessing",
    "Etoudi",
    "Awae Escalier",
    "Dragage",
    "Essos",
    "Nkolmessing",
    "Etoudi",
    "Awae Escalier",
    "Dragage",
    "Essos",
    "Nkolmessing",
    "Etoudi",
    "Awae Escalier",
    "Dragage",
    "Essos",
    "Nkolmessing",
    "Etoudi",
    "Awae Escalier",
    "Dragage",
    "Essos",
    "Nkolmessing",
    "Etoudi",
    "Awae Escalier",
    "Dragage",
    "Essos"
  ];

  final recentCities = ["Etoudi", "Awae Escalier", "Dragage", "Essos"];

  String result = '';

  @override
  List<Widget> buildActions(BuildContext context) {
    // Action for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        color: Color(0xff55C9EA),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      color: Color(0xff55C9EA),
      onPressed: () {
        close(context, result);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show some result based on the selection
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.red,
          shape: StadiumBorder(),
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show when someone searches for something
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                  color: Color(0xff55C9EA), fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                )
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
