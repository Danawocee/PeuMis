
import 'package:flutter/material.dart';

class MyRoute {

  routeme(api){
    return Navigator.of(api).push(MaterialPageRoute(builder: (BuildContext
    context) =>api()));
  }
}

