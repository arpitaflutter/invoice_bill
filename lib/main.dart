import 'package:flutter/material.dart';

import 'bill.dart';
import 'homePage.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => homePage(),
        'bill':(context) => bill(),
      },
    ),
  );
}