import 'package:flutter/material.dart';

class PurplePage extends StatelessWidget {
  const PurplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Purple Page"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Purple Page",
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/orangePage');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade600),
              child: Text(
                "Turuncu sayfaya git",
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
