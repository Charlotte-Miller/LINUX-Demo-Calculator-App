import 'package:flutter/material.dart';

import 'ColorScheme.dart';
import 'HomePage.dart';

void main()
=> runApp(MyApp());

class MyApp extends StatelessWidget
{
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context)
    {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: MAXIMUM_GREEN, //Theme Color
            ),
            home: MyHomePage(title: 'Green Family Calculator'),
        );
    }
}