import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/plogo.png'),
                radius: 40,
              ),
              SpinKitCubeGrid(
                color: Color.fromRGBO(91, 29, 1, 1),
                size: 100.0,
              ),
              Center(
                  child: Text(
                'Processing..Please Wait',
                style: TextStyle(fontSize: 18.0),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
