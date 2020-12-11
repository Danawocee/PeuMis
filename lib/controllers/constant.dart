import "package:flutter/material.dart";

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 2.0)),
);

const textInputDecoration1 = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.indigo, width: 1.5, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        )),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.indigo, width: 1.5, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        )),
    labelStyle: TextStyle(color: Colors.indigo),
    helperStyle: TextStyle(color: Colors.indigo));

const textStyle = TextStyle(fontSize: 10.0, color: Colors.white);
