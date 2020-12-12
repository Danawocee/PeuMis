import 'package:flutter/material.dart';

import 'package:peumis/controllers/constant.dart';

import 'package:peumis/controllers/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class Enrolment extends StatefulWidget {
  @override
  _EnrolmentState createState() => _EnrolmentState();
}

class _EnrolmentState extends State<Enrolment> {
  bool loading = false;
  String _class;
  final _boys = TextEditingController();
  final _girls = TextEditingController();
  final _totaling = TextEditingController();

  String schname;
  SharedPreferences localStorage;

  @override
  void initState() {
    super.initState();
    _getSchname();
  }

  _getSchname() async {
    localStorage = await SharedPreferences.getInstance();
    setState(() {
      schname =
          localStorage.getString('schname') ?? 'Presbyterian Education Office';
    });
  }

  final _schform = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('$schname Enrolment'),
      ),
      body: loading
          ? Loading()
          : Scaffold(
              body: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(1, 1, 10, 1),
                          child: Container(
                            width: 800.0,
                            child: Card(
                              elevation: 30,
                              color: Color.fromRGBO(1, 29, 1, 0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: Column(children: <Widget>[
                                  Form(
                                    key: _schform,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        verticalDirection:
                                            VerticalDirection.down,
                                        children: <Widget>[
                                          DropdownButtonFormField(
                                            validator: (val) => val == null
                                                ? 'Please Select Class'
                                                : null,
                                            decoration:
                                                textInputDecoration.copyWith(
                                                    prefixIcon: Icon(
                                                      Icons.place,
                                                      color: Colors.black,
                                                    ),
                                                    labelText: "Class",
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'pangolin',
                                                        color: Colors.black,
                                                        fontSize: 20.0)),
                                            value: _class,
                                            items: Classes()
                                                .myclasses
                                                .map((district) {
                                              return DropdownMenuItem(
                                                value: district,
                                                child: Text(
                                                  '$district',
                                                  style: textStyle.copyWith(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String value) {
                                              _class = value;
                                            },
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          TextFormField(
                                            controller: _boys,
                                            validator: (val) => val.isEmpty
                                                ? 'Enter Number of Boys'
                                                : null,
                                            keyboardType: TextInputType.number,
                                            decoration:
                                                textInputDecoration.copyWith(
                                                    prefixIcon: Icon(
                                                      Icons.child_care,
                                                      color: Colors.black,
                                                    ),
                                                    labelText: "Boys",
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'pangolin',
                                                        color: Colors.black)),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          TextFormField(
                                            controller: _girls,
                                            validator: (val) => val.isEmpty
                                                ? 'Enter Number of Girls'
                                                : null,
                                            keyboardType: TextInputType.number,
                                            decoration:
                                                textInputDecoration.copyWith(
                                                    prefixIcon: Icon(
                                                      Icons
                                                          .pregnant_woman_outlined,
                                                      color: Colors.black,
                                                    ),
                                                    labelText: "Girls",
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'pangolin',
                                                        color: Colors.black)),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          TextFormField(
                                            controller: _totaling,
                                            enabled: false,
                                            validator: (val) => val.isEmpty
                                                ? 'Enter Total'
                                                : null,
                                            keyboardType: TextInputType.number,
                                            decoration:
                                                textInputDecoration.copyWith(
                                                    prefixIcon: Icon(
                                                      Icons.person_add,
                                                      color: Colors.black,
                                                    ),
                                                    labelText: "Totaling",
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'pangolin',
                                                        color: Colors.black)),
                                          ),
                                          SizedBox(
                                            height: 25.0,
                                          ),
                                          SizedBox(
                                            height: 50.0,
                                            width: 400.0,
                                            child: new RaisedButton(
                                              child: Text(
                                                'Submit',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.0),
                                              ),
                                              color: Colors.green,
                                              onPressed: () {
                                                if (_schform.currentState
                                                    .validate()) {
                                                  //_submitdata();
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  void showToast(String msg, int duration, int gravity) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}

class Classes {
  final List<String> myclasses = [
    'N1',
    'N2',
    'KG1',
    'KG2',
    'BS1',
    'BS2',
    'BS3',
    'BS4',
    'BS5',
    'BS6',
    'JHS1',
    'JHS2',
    'JHS3'
  ];
}
