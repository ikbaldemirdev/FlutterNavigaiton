import 'dart:math';

import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  RedPage({super.key});
  int _rastgeleSayi = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // kullanıcı bir sayfadan çıkarken veri kaydetme, onay isteme veya başka bir özel işlem yapma ihtiyacı olduğunda kullanılır.
      onWillPop: () {
        print("on will pop çalıştı");
        if (_rastgeleSayi == 0) {
          _rastgeleSayi = Random().nextInt(100);
          Navigator.pop(context, _rastgeleSayi);
          return Future.value(true);
        }

        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false, // sayfaya geri dönmeyi kaldırmak için kullanırız.
          title: Text("Red Page"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Red Page",
                style: TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                onPressed: () {
                  _rastgeleSayi = Random().nextInt(100);
                  print("Üretilen sayı $_rastgeleSayi");
                  Navigator.of(context).pop(
                      _rastgeleSayi); // push ile eleman eklenir pop ile elman çıkarılır.
                },
                child: Text("Geri Dön"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    print("Evet pop olabilir.");
                  } else
                    print("Hayir olamaz.");
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade600),
                child: Text(
                  "Can Pop Kullanimi",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/orangePage');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade600),
                child: Text(
                  "Goto Orange",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
