import 'package:firstapp/vues/admin/dashboardadmin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ConnexionAdmin extends StatefulWidget {
  const ConnexionAdmin({super.key});

  @override
  State<ConnexionAdmin> createState() {
    return _ConnexionAdmin();
  }
}

class _ConnexionAdmin extends State<ConnexionAdmin> {
  TextEditingController emailT = TextEditingController();
  TextEditingController code = TextEditingController();

  String email = "";
  String cod = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
            "CONNEXION",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ListView(
          reverse: true,
          children: [
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height -
                    kToolbarHeight -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 230, 251, 226)),
                child: Container(
                  color: const Color.fromARGB(255, 230, 251, 226),
                  padding: const EdgeInsets.only(bottom: 80),
                  margin: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.school_outlined,
                          size: MediaQuery.of(context).size.width * 0.3,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextField(
                          controller: emailT,
                          decoration: const InputDecoration(
                            label: Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: code,
                          obscureText: true,
                          decoration: const InputDecoration(
                            label: Text(
                              "Code",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 128, 130, 132),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Mot de passe oublié ?",
                            style: TextStyle(
                                fontSize: 20, fontStyle: FontStyle.italic),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (code.text.isEmpty || emailT.text.isEmpty) {
                              EasyLoading.showError(
                                "Veuillez renseigner tous les champs du formulaire",
                                duration: const Duration(milliseconds: 2500),
                              );
                            } else {
                              email = emailT.text;
                              cod = code.value.text;
                              if (!email.isEmail) {
                                EasyLoading.showError(
                                  "Votre email est invalide",
                                  duration: const Duration(milliseconds: 2500),
                                );
                              } else {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const DashboardAdmin(),
                                  ),
                                );
                              }
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 2, 53, 95),
                            ),
                          ),
                          child: const Text(
                            "Se connecter",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
