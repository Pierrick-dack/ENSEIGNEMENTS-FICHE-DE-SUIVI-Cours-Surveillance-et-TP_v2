
import 'package:firstapp/vues/admin/connexionAdmin.dart';
import 'package:firstapp/vues/prof/connexionprof.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/vues/delegue/connexion_delegu%C3%A9.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() {
    return _AccueilPage();
  }
}

class _AccueilPage extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 2, 53, 95)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "BIENVENUE SUR NOTRE PLATE FORME DE GESTION DES ENSEIGNEMENTS",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontFamily: "Times New Roman"),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/logouniv.jpg",
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  const Text(
                    "Connecter vous en tant que:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => ConnexionProf()));
                        },
                        style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(
                            Size(250, 40),
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 203, 97, 129),
                          ),
                        ),
                        child: const Text(
                          "Professeur",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontFamily: "Arial"),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const ConnexionAdmin(),
                            ),
                          );
                        },
                        style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(
                            Size(250, 40),
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 203, 97, 129),
                          ),
                        ),
                        child: const Text(
                          "Administrateur",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const ConnexionDelegue(),
                            ),
                          );
                        },
                        style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(250, 40)),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 203, 97, 129),
                          ),
                        ),
                        child: const Text(
                          "Etudiant",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
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
