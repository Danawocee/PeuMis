import 'package:flutter/material.dart';

import 'package:peumis/views/dashboard.dart';
import 'package:peumis/views/loginpage.dart';
import 'package:peumis/views/school.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enrolment.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences localStorage;
  String user;
  String schname;

  //String get s => null;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    localStorage = await SharedPreferences.getInstance();
    setState(() {
      user = localStorage.getString('user') ?? 'PeuMis';
      schname =
          localStorage.getString('schname') ?? 'Presbyterian Education Office';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PEUMIS",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('PUE-ER EMIS'),
//          leading: Image(
//            image: AssetImage('assets/plogo.png'),
//          ),
          actions: [
            new IconButton(
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {
                _logout();
              },
            ),
          ],
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text(
                  '$user',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                accountEmail: Text('$schname'),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                ),
                decoration: new BoxDecoration(color: Colors.indigo),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Schools()));
                },
                child: ListTile(
                  title: Text('School Profile'),
                  leading: Icon(Icons.school),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Enrolment()));
                },
                child: ListTile(
                  title: Text('Enrolment'),
                  leading: Icon(Icons.school),
                ),
              ),
              InkWell(
                  onTap: () {
                    _logout();
                  },
                  child: ListTile(
                    title: Text('Logout'),
                    leading: Icon(
                      Icons.power_settings_new,
                      color: Colors.red,
                    ),
                  )),
            ],
          ),
        ),
        body: Dashboard(),
      ),
    );
  }

  void _logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove("token");
    Navigator.push(context, MaterialPageRoute(builder: (contex) => SignIn()));
  }
}
