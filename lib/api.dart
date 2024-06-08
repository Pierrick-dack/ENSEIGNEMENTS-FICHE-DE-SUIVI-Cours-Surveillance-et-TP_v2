import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:firstapp/urls.dart';

//String url = 'http://127.0.0.1:8000';

/*class StoreController extends GetxController {
  final isSaving = false.obs;

  Future store({
    required String titreSeance,
  }) async {
    try {
      isSaving.value = true;
      var data = {
        'titreSeance': titreSeance,
      };

      var response = await http.post(
        Uri.parse(url + 'store'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );
      if (response.statusCode == 200) {
        isSaving.value = true;
        debugPrint(json.decode(response.body));
      } else {
        isSaving.value = true;
        debugPrint(json.decode(response.body));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}*/

class API {
  postRequest({required String route, required var data}) async {
    print(route);
    try {
      return await http.post(
        Uri.parse(route),
        body: data,
        headers: _header(),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return 'error';
    }
  }

  _header() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
