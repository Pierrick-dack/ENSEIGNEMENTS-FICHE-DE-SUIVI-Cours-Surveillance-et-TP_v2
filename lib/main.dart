import 'package:firstapp/accueil_page.dart';
import 'package:firstapp/localdb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MaterialApp(
    builder: EasyLoading.init(),
    debugShowCheckedModeBanner: false,
    home: const AccueilPage(),
  ));
  
}
