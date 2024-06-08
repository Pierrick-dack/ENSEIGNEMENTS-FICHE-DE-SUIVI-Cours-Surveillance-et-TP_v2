import 'package:firstapp/accueil_page.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: Navigator.of(context).pop,
          ),
          title: const Text(
            "PROFIL DE DELEGUE",
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const AccueilPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.output_sharp,
                size: 30,
              ),
            )
          ],
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.50,
                height: MediaQuery.of(context).size.width * 0.50,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          maxRadius: MediaQuery.of(context).size.width * 0.50,
                          minRadius: MediaQuery.of(context).size.width * 0.50,
                          backgroundColor:
                              const Color.fromARGB(255, 239, 239, 239),
                          child: const Icon(
                            Icons.person,
                            size: 160,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Nom: "),
                          const Text("JOHN DOE"),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: const Text(
                              "Ce nom n'est pas celui qui figure dans les listes officielles, il est un pseudonyme pour vous reconnaitre au sein de l'application. Neanmoins nous vous recommendons d'utiliser votre nom propre.",
                              style: TextStyle(
                                color: Color.fromARGB(255, 135, 135, 135),
                              ),
                            ),
                          ),
                        ],
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.data_array),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Matricule: "),
                          const Text("JOHN DOE"),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.subdirectory_arrow_left_outlined),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Niveau: "),
                          const Text("JOHN DOE"),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                          ),
                        ],
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.password),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Code: "),
                          const Text("JOHN DOE"),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
