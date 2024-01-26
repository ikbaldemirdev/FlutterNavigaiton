//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/main.dart';
import 'package:flutter_navigation/ogrenci_detay.dart';
import 'package:flutter_navigation/ogrenci_listesi.dart';
import 'package:flutter_navigation/orange_page.dart';
import 'package:flutter_navigation/purple_page.dart';
import 'package:flutter_navigation/yellow_page.dart';

class RouteGenerator {
  static Route<dynamic>? _routeOlustur(
      Widget gidilecekWidget, RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      // hem ios hem andriodde çalışsın diye yapılmıştır.
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android)
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
    else
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _routeOlustur(AnaSayfa(), settings);

      case '/orangePage':
        return _routeOlustur(OrangePage(), settings);
      case '/yellowPage':
        return _routeOlustur(YellowPage(), settings);

      case '/ogrenciListesi':
        return _routeOlustur(OgrenciListesi(), settings);

      case '/ogrenciDetay':
        var parametredekiOgrenci = settings.arguments as Ogrenci;
        return _routeOlustur(
            OgrenciDetay(
              secilenOgrenci: parametredekiOgrenci,
            ),
            settings);
      case '/purplePage':
        return _routeOlustur(PurplePage(), settings);

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
