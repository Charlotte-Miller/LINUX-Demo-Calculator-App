import 'dart:ui';
import 'package:flutter/material.dart';

//@author: Phan Khanh Nam

const Map<int, Color> CUSTOM_COLOR =
{
    50: Color.fromRGBO(105, 138, 50, .1),
    100: Color.fromRGBO(105, 138, 50, .2),
    200: Color.fromRGBO(105, 138, 50, .3),
    300: Color.fromRGBO(105, 138, 50, .4),
    400: Color.fromRGBO(105, 138, 50, .5),
    500: Color.fromRGBO(105, 138, 50, .6),
    600: Color.fromRGBO(105, 138, 50, .7),
    700: Color.fromRGBO(105, 138, 50, .8),
    800: Color.fromRGBO(105, 138, 50, .9),
    900: Color.fromRGBO(105, 138, 50, 1),
};

//Build custom colors base on this site: https://coolors.co/063f21-8ab62d-708e30-d1d44a-698a32
const MaterialColor MAXIMUM_GREEN = MaterialColor(0xFF698A32, CUSTOM_COLOR);
const MaterialColor MAXIMUM_GREEN_YELLOW = MaterialColor(0xFFD1D44A, CUSTOM_COLOR);
const MaterialColor OLIVE_DRAB = MaterialColor(0xFF708E30, CUSTOM_COLOR);
const MaterialColor YELLOW_GREEN = MaterialColor(0xFF8AB62D, CUSTOM_COLOR);
const MaterialColor UP_FOREST_GREEN = MaterialColor(0xFF063F21, CUSTOM_COLOR);
