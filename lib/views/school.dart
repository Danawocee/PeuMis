import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:peumis/controllers/constant.dart';
import 'package:peumis/controllers/districts.dart';
import 'package:peumis/controllers/loading.dart';
import 'package:peumis/models/api.dart';
import 'package:toast/toast.dart';

class Schools extends StatefulWidget {
  @override
  _SchoolsState createState() => _SchoolsState();
}

class _SchoolsState extends State<Schools> {
  bool loading = false;
  String _district;
  String _presbytery;
  final _staffid = TextEditingController();
  final _schname = TextEditingController();
  final _town = TextEditingController();

  final _staffcount = TextEditingController();
  final _schform = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('School Profile'),
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
                                          TextFormField(
                                            controller: _staffid,
                                            keyboardType: TextInputType.text,
                                            decoration:
                                                textInputDecoration.copyWith(
                                                    prefixIcon: Icon(
                                                      Icons.person,
                                                      color: Colors.black,
                                                    ),
                                                    labelText: "Staff Id",
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'pangolin',
                                                        color: Colors.black)),
                                            validator: (val) => val.isEmpty
                                                ? "Enter Staff Id"
                                                : null,
                                            onChanged: (val) {},
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          TextFormField(
                                            controller: _schname,
                                            validator: (val) => val.isEmpty
                                                ? 'Enter School Name'
                                                : null,
                                            keyboardType: TextInputType.text,
                                            decoration:
                                                textInputDecoration.copyWith(
                                                    prefixIcon: Icon(
                                                      Icons.school,
                                                      color: Colors.black,
                                                    ),
                                                    labelText: "School Name",
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'pangolin',
                                                        color: Colors.black)),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          TextFormField(
                                            controller: _town,
                                            validator: (val) => val.isEmpty
                                                ? 'Enter Town'
                                                : null,
                                            keyboardType: TextInputType.text,
                                            decoration:
                                                textInputDecoration.copyWith(
                                                    prefixIcon: Icon(
                                                      Icons.home,
                                                      color: Colors.black,
                                                    ),
                                                    labelText: "Town",
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'pangolin',
                                                        color: Colors.black)),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          DropdownButtonFormField(
                                            validator: (val) => val == null
                                                ? 'Please Select District'
                                                : null,
                                            decoration:
                                                textInputDecoration.copyWith(
                                                    prefixIcon: Icon(
                                                      Icons.place,
                                                      color: Colors.black,
                                                    ),
                                                    labelText: "District",
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'pangolin',
                                                        color: Colors.black)),
                                            value: _district,
                                            items: Utilities()
                                                .districts
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
                                              _district = value;
                                            },
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          DropdownButtonFormField(
                                            validator: (val) => val == null
                                                ? 'Please Select Presbytery'
                                                : null,
                                            decoration:
                                                textInputDecoration.copyWith(
                                                    prefixIcon: Icon(
                                                      Icons.ac_unit,
                                                      color: Colors.black,
                                                    ),
                                                    labelText: "Presbytery",
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'pangolin',
                                                        color: Colors.black)),
                                            value: _presbytery,
                                            items: Utilities()
                                                .presbyterys
                                                .map((presbytery) {
                                              return DropdownMenuItem(
                                                value: presbytery,
                                                child: Text(
                                                  '$presbytery',
                                                  style: textStyle.copyWith(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String value) {
                                              _presbytery = value;
                                            },
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          TextFormField(
                                            controller: _staffcount,
                                            validator: (val) => val.isEmpty
                                                ? 'Enter Staffing Enrolment'
                                                : null,
                                            keyboardType: TextInputType.number,
                                            decoration:
                                                textInputDecoration.copyWith(
                                                    prefixIcon: Icon(
                                                      Icons.person_add,
                                                      color: Colors.black,
                                                    ),
                                                    labelText: "Staff Count",
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
                                                  _submitdata();
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

  void _submitdata() async {
    setState(() {
      loading = true;
    });
    var data = {
      "staffid": _staffid.text,
      "schname": _schname.text,
      "town": _town.text,
      "district": _district,
      "presbytery": _presbytery,
      "staffcount": _staffcount.text
    };
    var body;
    //showToast(NetworkAPI().showUrl("save-school"), 5, 5) ;
    try {
      var schools = await NetworkAPI().authData(data, "save-school");
      body = json.decode(schools.body);
      if (body['status'] == 200) {
        //showToast(NetworkAPI().showUrl("save-school"), 5, 5) ;
        setState(() {
          loading = false;
        });
        showToast("Data Saved Successfully", 5, 5);
        _staffid.text = "";
        _schname.text = "";
        _town.text = "";
        // _district = "Select District";
        //_presbytery = "Select Presbytery";
        _staffcount.text = "";
      } else {
        setState(() {
          loading = false;
        });
        showToast(body['message'], 5, 5);
      }
    } catch (e) {
      setState(() {
        loading = false;
      });
      showToast(body, 8, 5);
    }
  }
}
