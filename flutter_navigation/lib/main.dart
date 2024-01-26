import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/green_page.dart';
import 'package:flutter_navigation/orange_page.dart';
import 'package:flutter_navigation/red_page.dart';
import 'package:flutter_navigation/route_generator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material App",
      // home: AnaSayfa(),
      /* routes: {
        '/redPage': (context) => RedPage(),
        '/': (context) =>
            AnaSayfa(), // başlangıç sayfasını belirlediysek home yazan kısımı devre dışı bırakmamız gerekir.
        '/orangePage': (context) => OrangePage(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        // Girilen yolda yanlış olursa sayfa ismi vs. yanlış olduğunu gösterir.
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text("Error"),
          ),
          body: Center(
            child: Text('404'),
          ),
        ),
      ), */
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material App Bar"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                int? _gelenSayi = await Navigator.push<int>(
                  context,
                  CupertinoPageRoute(
                    builder: (redContext) => RedPage(),
                  ), // IOS sitili çalıştırma yazılan kod stili.
                );
                print("Ana Sayfadaki sayi $_gelenSayi");
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade300),
              child: Text(
                "Kirmizi sayfaya gir IOS",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context, route); // alttakide buda bire bir aynı Navigator sınıfı aslında uygulama baştılırken otomatik oluşturuluyor ama kullanmıa açmıyoruz. Navigator yapısı içinde rotaların bulunduğu bir yığın yapısıdır.
                Navigator.of(context)
                    .push<int>(
                  MaterialPageRoute(
                    builder: (redcontext) => RedPage(),
                  ),
                )
                    .then((int? value) {
                  debugPrint("Gelen Sayi $value");
                }); // gittiğimiz sayfadaki ve geri döndüğümüz sayfadaki ürettilen rastgele sayıyı terminale yazdırdım.
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600),
              child: Text(
                "Kirmizi sayfaya gir Android",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).maybePop();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600),
              child: Text(
                "Maybe Pop Kullanimi",
              ),
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
                Navigator.of(context).pushReplacement(
                  // direkt olarak o sayfaya uğramadan direkt çıkmak için kullanılır.
                  MaterialPageRoute(
                    builder: (context) => GreenPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600),
              child: Text(
                "Push Replacament Kullanimi",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pushNamed(routeName); alttakiyle aynısı
                Navigator.pushNamed(context,
                    '/orangePage'); // bu yolu diğerlerinin kısa olarak düşünebiliriz.
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade600),
              child: Text(
                "PushNamed Kullanimi",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pushNamed(routeName); alttakiyle aynısı
                Navigator.pushNamed(context,
                    '/yellowPage'); // bu yolu diğerlerinin kısa olarak düşünebiliriz.
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow.shade600),
              child: Text(
                "PushNamed Kullanimi Yellow",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/ogrenciListesi', arguments: 80);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade600),
              child: Text(
                "Liste Oluştur",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/purplePage');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade600),
              child: Text(
                "Mora Git",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
