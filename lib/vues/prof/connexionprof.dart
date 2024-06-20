import 'package:firstapp/localdb.dart';
import 'package:firstapp/models/enseignant.dart';
import 'package:firstapp/vues/admin/dashboardadmin.dart';
import 'package:firstapp/vues/delegue/dashboardelegue.dart';
import 'package:firstapp/vues/prof/dasboardprof.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ConnexionProf extends StatefulWidget {
  const ConnexionProf({super.key});

  @override
  State<ConnexionProf> createState() {
    return _ConnexionProf();
  }
}

List<Enseignant> enseignants = [];

class _ConnexionProf extends State<ConnexionProf> {
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
                    Icons.supervisor_account,
                    size: MediaQuery.of(context).size.width * 0.3,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const SizedBox(
                    height: 15,
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
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
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
                          recup(enseignants, context);
                          for (int i = 0; i < enseignants.length; i++) {
                            if (email == enseignants[i].emailEns &&
                                cod == enseignants[i].mdpEns) {
                              Enseignant enseignante = enseignants[i];
                              EasyLoading.showSuccess("Connexion reussie",
                                  duration: const Duration(milliseconds: 2500));
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => DashboardProf(
                                    prof: enseignante,
                                  ),
                                ),
                              );
                            }
                          }
                          EasyLoading.showError("Identifiants incorrect",
                              duration: const Duration(milliseconds: 2500));
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

void recup(List<Enseignant> enseignant, context) async {
  Future<List<Enseignant>> enseignants =
      LocalDataBase(context).getEnseignants();
  List<Enseignant> enseigne = await enseignants;
  if (enseignant.isNotEmpty) {
    enseignant.clear();
  }
  enseignant.addAll(enseigne);

  //print(Enseignant);
}
