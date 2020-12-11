import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:peumis/controllers/constant.dart';
import 'package:peumis/controllers/loading.dart';
import 'package:peumis/models/api.dart';
import 'package:peumis/views/loginpage.dart';
import 'package:toast/toast.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _staffid = TextEditingController();
  final _fname = TextEditingController();
  final _schoolname = TextEditingController();
  final _telephone = TextEditingController();
  final _pin = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmpassword = TextEditingController();
  bool loading = false;
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
                  child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(15.0),
                children: <Widget>[
                  Text(
                    "CREATE AN ACCOUNT",
                    style: textStyle.copyWith(fontSize: 12.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                    child: Container(
                      width: 700,
                      height: 750,
                      child: Card(
                        elevation: 10,
                        color: Color.fromRGBO(9, 2, 1, 0),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: Column(
                            children: <Widget>[
                              Form(
                                  key: _formKey,
                                  child: SingleChildScrollView(
                                      child: Column(
                                    verticalDirection: VerticalDirection.down,
                                    children: <Widget>[
                                      TextFormField(
                                        controller: _staffid,
                                        keyboardType: TextInputType.text,
                                        decoration:
                                            textInputDecoration.copyWith(
                                                prefixIcon: Icon(Icons.security,
                                                    color: Color.fromRGBO(
                                                        91, 29, 107, 1)),
                                                labelText: 'Staff Id',
                                                labelStyle: TextStyle(
                                                    fontFamily: 'pangolin',
                                                    color: Colors.redAccent)),
                                        validator: (val) => val.isEmpty
                                            ? "Enter Staff Id"
                                            : null,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      TextFormField(
                                        controller: _fname,
                                        keyboardType: TextInputType.text,
                                        decoration:
                                            textInputDecoration.copyWith(
                                                prefixIcon: Icon(
                                                    Icons
                                                        .supervised_user_circle,
                                                    color: Color.fromRGBO(
                                                        91, 29, 107, 1)),
                                                labelText: 'Full Name',
                                                labelStyle: TextStyle(
                                                    fontFamily: 'pangolin',
                                                    color: Colors.redAccent)),
                                        validator: (val) => val.isEmpty
                                            ? "Enter Full Name"
                                            : null,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      TextFormField(
                                        controller: _schoolname,
                                        keyboardType: TextInputType.text,
                                        decoration:
                                            textInputDecoration.copyWith(
                                                prefixIcon: Icon(Icons.school,
                                                    color: Color.fromRGBO(
                                                        91, 29, 107, 1)),
                                                labelText: 'School Name',
                                                labelStyle: TextStyle(
                                                    fontFamily: 'pangolin',
                                                    color: Colors.redAccent)),
                                        validator: (val) => val.isEmpty
                                            ? "Enter School Name"
                                            : null,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      TextFormField(
                                        controller: _telephone,
                                        keyboardType: TextInputType.number,
                                        decoration:
                                            textInputDecoration.copyWith(
                                                prefixIcon: Icon(Icons.phone,
                                                    color: Color.fromRGBO(
                                                        91, 29, 107, 1)),
                                                labelText: 'Telephone Number',
                                                labelStyle: TextStyle(
                                                    fontFamily: 'pangolin',
                                                    color: Colors.redAccent)),
                                        validator: (val) => val.isEmpty
                                            ? "Enter Telephone Number"
                                            : null,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      TextFormField(
                                        controller: _pin,
                                        keyboardType: TextInputType.number,
                                        decoration:
                                            textInputDecoration.copyWith(
                                                prefixIcon: Icon(
                                                    Icons.lock_rounded,
                                                    color: Color.fromRGBO(
                                                        91, 29, 107, 1)),
                                                labelText: 'Pin from Developer',
                                                labelStyle: TextStyle(
                                                    fontFamily: 'pangolin',
                                                    color: Colors.redAccent)),
                                        validator: (val) =>
                                            val.isEmpty ? "Enter Pin" : null,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      TextFormField(
                                        controller: _email,
                                        keyboardType: TextInputType.text,
                                        decoration:
                                            textInputDecoration.copyWith(
                                                prefixIcon: Icon(Icons.school,
                                                    color: Color.fromRGBO(
                                                        91, 29, 107, 1)),
                                                labelText: 'Email',
                                                labelStyle: TextStyle(
                                                    fontFamily: 'pangolin',
                                                    color: Colors.redAccent)),
                                        validator: (val) => val.isEmpty
                                            ? "Missing Email"
                                            : null,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      TextFormField(
                                        controller: _password,
                                        obscureText: true,
                                        keyboardType: TextInputType.text,
                                        decoration:
                                            textInputDecoration.copyWith(
                                                prefixIcon: Icon(Icons.vpn_key,
                                                    color: Color.fromRGBO(
                                                        91, 29, 107, 1)),
                                                labelText: 'Password',
                                                labelStyle: TextStyle(
                                                    fontFamily: 'pangolin',
                                                    color: Colors.redAccent)),
                                        validator: (val) => val.isEmpty
                                            ? "Enter Password"
                                            : null,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      TextFormField(
                                        controller: _confirmpassword,
                                        obscureText: true,
                                        keyboardType: TextInputType.text,
                                        decoration:
                                            textInputDecoration.copyWith(
                                                prefixIcon: Icon(Icons.vpn_key,
                                                    color: Color.fromRGBO(
                                                        91, 29, 107, 1)),
                                                labelText: 'Confirm Password',
                                                labelStyle: TextStyle(
                                                    fontFamily: 'pangolin',
                                                    color: Colors.redAccent)),
                                        validator: (val) => val.isEmpty
                                            ? "Enter Password"
                                            : null,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      RaisedButton(
                                        color: Colors.green,
                                        onPressed: () async {
                                          if (_formKey.currentState
                                              .validate()) {
                                            _register();
                                          }
                                        },
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )))
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
            ),
          ));
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  void _register() async {
    setState(() {
      loading = true;
    });
    var data = {
      "staff_id": _staffid.text,
      'name': _fname.text,
      "school_name": _schoolname.text,
      "telephone": _telephone.text,
      "pin": _pin.text,
      "email": _email.text,
      'password': _password.text,
      'confirm_pass': _confirmpassword.text,
    };
    //showToast(NetworkAPI().showUrl("register"), duration: 10, gravity: 3);

    var res = await NetworkAPI().authData(data, 'register');
    var body = json.decode(res.body);
    if (body['status'] == 200) {
      setState(() {
        loading = false;
      });
      showToast("Data Saved Successfully", duration: 5, gravity: 5);

      _staffid.text = "";
      _fname.text = "";
      _schoolname.text = "";
      _telephone.text = "";
      _pin.text = "";
      _email.text = "";
      _password.text = "";
      _confirmpassword.text = "";
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) => SignIn()));
    } else {
      setState(() {
        loading = false;
      });
      showToast(body['message'], duration: 10, gravity: 5);
    }
  }
}
