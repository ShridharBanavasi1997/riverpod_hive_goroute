import 'package:flutter/material.dart';

abstract class StateManagementProvidersInterface{
  Color getColor();
  void setColor(Color color);
  int getSize();
  void setSize();
}