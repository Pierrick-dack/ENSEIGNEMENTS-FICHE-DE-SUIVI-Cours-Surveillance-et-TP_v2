import 'package:firstapp/accueil_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProfileProf extends StatefulWidget {
  const ProfileProf({super.key});

  @override
  State<ProfileProf> createState() {
    return _ProfileProfState();
  }
}

TextEditingController controler = TextEditingController();

class _ProfileProfState extends State<ProfileProf> {
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
            "PROFIL DE PROFESSEUR",
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const AccueilPage(),
                    ),
                  );
                },
                iconSize: 30,
                icon: const Icon(Icons.exit_to_app))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
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
                              maxRadius:
                                  MediaQuery.of(context).size.width * 0.50,
                              minRadius:
                                  MediaQuery.of(context).size.width * 0.50,
                              backgroundColor:
                                  const Color.fromARGB(255, 212, 211, 211),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.width * 0.34,
                            right: 0,
                            child: IconButton(
                              style: ButtonStyle(
                                iconColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                                iconSize: MaterialStateProperty.all(30),
                                backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 2, 53, 95),
                                ),
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.photo_camera),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        DesignWidget(
                          text: "nom",
                          information: "information",
                          controller: controler,
                          icon: const Icon(Icons.person),
                        ),
                        DesignWidget(
                            text: "prenom",
                            information: "information",
                            controller: controler,
                            icon: const Icon(
                              Icons.label,
                            )),
                        DesignWidget(
                            text: "departement",
                            information: "information",
                            controller: controler,
                            icon: const Icon(Icons.school_sharp)),
                        DesignWidget(
                            text: "email",
                            controller: controler,
                            information: "information",
                            icon: const Icon(Icons.email_outlined)),
                        Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: const Text(
                                  "les informations ci dessus sont celles qui sont utilisées uniquement sur la plate forme")),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

class DesignWidget extends StatefulWidget {
  DesignWidget(
      {Key? key,
      required this.text,
      required this.information,
      required this.controller,
      required this.icon})
      : super(key: key);

  final String text;
  String information;
  final Icon icon;
  final TextEditingController controller;
  @override
  State<DesignWidget> createState() {
    return _DesignWidget();
  }
}

class _DesignWidget extends State<DesignWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.icon,
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.text,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.information,
                      style: const TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            content: SingleChildScrollView(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "MODIFIER",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Form(
                                      child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                          "Veuillez saisir la nouvelle information"),
                                      TextFormField(
                                        controller: widget.controller,
                                        decoration: InputDecoration(
                                            labelText: widget.text),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                if (widget
                                                    .controller.text.isEmpty) {
                                                  EasyLoading.showInfo(
                                                      "Votre information est vide",
                                                      duration: const Duration(
                                                          milliseconds: 2500));
                                                } else {
                                                  widget.information =
                                                      widget.controller.text;
                                                  //mise a jour dans la base de données
                                                }
                                              },
                                              child: const Text("Valider")),
                                          ElevatedButton(
                                              onPressed: () {
                                                widget.controller.clear();
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Annuler"))
                                        ],
                                      )
                                    ],
                                  )),
                                )
                              ],
                            )),
                          );
                        });
                  },
                  icon: const Icon(Icons.mode)),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}



