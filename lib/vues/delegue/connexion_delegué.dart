import 'package:firstapp/vues/delegue/dashboardelegue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ConnexionDelegue extends StatefulWidget {
  const ConnexionDelegue({super.key});

  @override
  State<ConnexionDelegue> createState() {
    return _ConnexionDelegue();
  }
}

class _ConnexionDelegue extends State<ConnexionDelegue> {
  TextEditingController matricule = TextEditingController();
  TextEditingController code = TextEditingController();

  String matricul = "";
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 230, 251, 226)),
          child: Container(
            color: const Color.fromARGB(255, 230, 251, 226),
            padding: const EdgeInsets.symmetric(),
            margin: const EdgeInsets.all(40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.person,
                    size: MediaQuery.of(context).size.width * 0.3,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: matricule,
                    decoration: const InputDecoration(
                      label: Text(
                        "Matricule",
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
                    obscureText: true,
                    controller: code,
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
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (code.text.isEmpty || matricule.text.isEmpty) {
                        EasyLoading.showError(
                            "remplissez tous les champs s'il vous plait",
                            duration: const Duration(milliseconds: 3000));
                      } else {
                        matricul = matricule.value.toString();
                        cod = code.value.toString();
                        int a = matricule.text.length;
                        if (a != 7) {
                          setState(() {
                            EasyLoading.showError(
                                "Votre matricule est incorrect",
                                duration: const Duration(milliseconds: 3000));
                          });
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const DashboardDelegue(),
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
    );
  }
}
