import 'package:flutter/material.dart';

double getScreenWidth({required BuildContext context}) =>
    MediaQuery.of(context).size.width;

double getScreenHeight({required BuildContext context}) =>
    MediaQuery.of(context).size.height;
