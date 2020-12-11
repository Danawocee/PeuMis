import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:peumis/controllers/constant.dart';
import 'package:peumis/controllers/loading.dart';
import 'package:peumis/models/api.dart';
import 'package:peumis/views/home.dart';
import 'package:peumis/views/signUppage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String staffid = "";
  String password = "";
  String error = "";
  bool loading = false;

  String user, schname;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bkk.jpeg'), fit: BoxFit.cover),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 120, 0)),
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/plogo.png'),
                              radius: 30,
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/ges.jpeg'),
                              radius: 30,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            15,
                            20,
                            15,
                            0,
                          ),
                          child: Container(
                            width: 300,
                            height: 328,
                            child: Card(
                              // elevation: 30,
                              color: Color.fromRGBO(1, 29, 1, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 30, 30, 0),
                                child: Column(
                                  children: <Widget>[
                                    Form(
                                      key: _formKey,
                                      child: SingleChildScrollView(
                                        child: Column(
                                            verticalDirection:
                                                VerticalDirection.down,
                                            children: <Widget>[
                                              //username textfield
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: textInputDecoration
                                                    .copyWith(
                                                        prefixIcon: Icon(
                                                            Icons.person,
                                                            color:
                                                                Color.fromRGBO(
                                                                    91,
                                                                    29,
                                                                    107,
                                                                    1)),
                                                        labelText: 'Staff Id',
                                                        labelStyle: TextStyle(
                                                            fontFamily:
                                                                'pangolin',
                                                            color: Colors
                                                                .redAccent)),
                                                validator: (val) => val.isEmpty
                                                    ? 'Enter Staff Id'
                                                    : null,
                                                onChanged: (val) {
                                                  setState(() {
                                                    staffid = val;
                                                  });
                                                },
                                              ),

                                              SizedBox(
                                                height: 10.0,
                                              ),

                                              //passsword textfield
                                              TextFormField(
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration:
                                                      textInputDecoration
                                                          .copyWith(
                                                    prefixIcon: Icon(
                                                        Icons.vpn_key,
                                                        color: Color.fromRGBO(
                                                            91, 29, 107, 1)),
                                                    labelText: 'Password',
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'pangolin',
                                                        color:
                                                            Colors.redAccent),
                                                  ),
                                                  validator: (val) => val
                                                              .length <
                                                          6
                                                      ? 'Enter a password 6+ chars long'
                                                      : null,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      password = val;
                                                    });
                                                  },
                                                  obscureText: true),
                                              SizedBox(height: 0),

                                              Column(
                                                children: <Widget>[
                                                  //Error Message
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        height: 12.0,
                                                      ),
                                                      Text(
                                                        error,
                                                        style:
                                                            textStyle.copyWith(
                                                                fontSize: 14.0,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ],
                                                  ),

                                                  //Raised button
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      Expanded(
                                                        child: RaisedButton(
                                                            elevation: 20.0,
                                                            /*shape:
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                    side:
                                                                        BorderSide(
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              214,
                                                                              185,
                                                                              237,
                                                                              1),
                                                                    )),*/
                                                            /* color: Color.fromRGBO(
                                                                242, 98, 46, 1),*/
                                                            color: Colors.green,
                                                            child: Text(
                                                              "Sign In",
                                                              style: textStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15.0),
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (_formKey
                                                                  .currentState
                                                                  .validate()) {
                                                                _login();
                                                              }
                                                            }),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      Expanded(
                                                          child: RaisedButton(
                                                              color: Colors.red,
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            SignUp(),
                                                                  ),
                                                                );
                                                              },
                                                              child: Text(
                                                                  "Sign Up",
                                                                  style: textStyle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              15.0))))
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                ],
                                              ),
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Dankoff v. 0.0.1",
                          style: textStyle.copyWith(color: Colors.cyan),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  void _login() async {
    setState(() {
      loading = true;
    });
    var data = {
      'staff_id': staffid,
      'password': password,
    };
    try {
      var res = await NetworkAPI().authData(data, "login");
      var body = json.decode(res.body);
      if (body['status'] == 200) {
        var datas = body['data'];
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', 'iloveakuatoomuchGodHelpme2020');
        localStorage.setString('user', datas['name']);
        localStorage.setString('schname', datas['school_name']);

        setState(() {
          loading = false;
        });
        showToast("Login Successfully Wait Redirect You Soon!!!",
            duration: 3, gravity: 5);

        Future.delayed(const Duration(milliseconds: 3000), () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => Home()));
        });
      } else {
        setState(() {
          loading = false;
        });
        showToast(body['message'], duration: 10, gravity: 5);
      }
    } catch (e) {
      showToast("Check Your Mobile Internet Connection",
          duration: 5, gravity: 5);
      setState(() {
        loading = false;
      });
    }
  }
}
