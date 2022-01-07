import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableClass{
  setRootView(Widget route){
    return MaterialApp(
      home: route,
    );
  }
}