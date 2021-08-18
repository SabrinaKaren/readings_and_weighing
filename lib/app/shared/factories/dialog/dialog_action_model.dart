import 'package:flutter/material.dart';

class DialogActionModel<T> {

  T child;
  VoidCallback onPressed;
  
  DialogActionModel({
    required this.child,
    required this.onPressed,
  });

}