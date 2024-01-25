//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/main.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        if (defaultTargetPlatform == TargetPlatform.iOS) {
          // hem ios hem andriodde çalışsın diye yapılmıştır.
          return CupertinoPageRoute(
            builder: (context) => AnaSayfa(),
          );
        } else if (defaultTargetPlatform == TargetPlatform.android)
          return MaterialPageRoute(
            builder: (context) => AnaSayfa(),
          );
        else
          return CupertinoPageRoute(
            builder: (context) => AnaSayfa(),
          );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text("404"),
            ),
            body: Center(
              child: Text('Sayfa Bulunamadi'),
            ),
          ),
        );
    }
  }
}
