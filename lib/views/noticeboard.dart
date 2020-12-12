import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String news;

  @override
  void initState() {
    super.initState();
    setState(() {
      news = "No News Found";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 1, 2, 1),
            child: Container(
              width: 800.0,
              child: Card(
                  elevation: 30,
                  child: Column(
                    children: <Widget>[
                      new Text(
                        "Notice Board",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      new Padding(
                          padding:
                              EdgeInsets.only(left: 2.0, right: 2.0, top: 2.0),
                          child: SingleChildScrollView(child: Text("$news")))
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
