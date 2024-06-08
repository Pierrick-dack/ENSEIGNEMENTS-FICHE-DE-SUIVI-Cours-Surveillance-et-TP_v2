import 'package:flutter/material.dart';

class ListeUe extends StatefulWidget {
  const ListeUe({super.key});

  State<ListeUe> createState() {
    return _ListeUe();
  }
}

class _ListeUe extends State<ListeUe> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 53, 95),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            "UNITES D'ENSEIGNEMENTS",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 225, 224, 224),
              ),
            )
          ],
        ),
      ),
    );
  }
}
