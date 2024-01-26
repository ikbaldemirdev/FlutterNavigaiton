import 'package:flutter/material.dart';

class OrangePage extends StatelessWidget {
  const OrangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orange Page"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Orange Page",
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                /* Navigator.popUntil(
                    context,
                    (route) => route
                        .isFirst); */ // sadece pop kullanırsak bir geri sayfaya dönerdi ama popUntil ile is first methodu ile en başa dönebiliriz.
                Navigator.of(context).popUntil((route) =>
                    route.settings.name ==
                    '/'); // dizini en başa yaptığımda burdanda en başa dönebilirim.
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade600),
              child: Text(
                "En başa geri dön",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .popUntil((route) => route.settings.name == '/purplePage');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade600),
              child: Text(
                "Mor sayfaya geri dön ",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/yellowPage', (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade600),
              child: Text(
                "Sarı sayfaya geri dön ",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
