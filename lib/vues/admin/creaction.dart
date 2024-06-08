import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

Widget creationDelegue(
    TextEditingController name,
    TextEditingController matricule,
    TextEditingController niveau,
    TextEditingController filiere) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "CREATION D'UN COMPTE DELEGUE",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  labelText: "Nom du delegue: ",
                ),
              ),
              TextFormField(
                controller: matricule,
                decoration: const InputDecoration(
                  labelText: "Matricule",
                ),
              ),
              TextFormField(
                controller: niveau,
                decoration: const InputDecoration(
                  labelText: "Niveau",
                ),
              ),
              TextFormField(
                controller: filiere,
                decoration: const InputDecoration(
                  labelText: "filière",
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

class CreationProf extends StatefulWidget {
  const CreationProf({Key? key, required this.text, required this.selection})
      : super(key: key);

  final TextEditingController text;
  final ValueChanged<int> selection;
  @override
  State<CreationProf> createState() {
    return _CreationProf();
  }
}

String _optionselectionnees = '';
List<int> niveaux = [];
List<String> _options = ['ICTL1', 'ICTL2', 'ICTL3', 'ICTL4', 'ICTL5'];

class _CreationProf extends State<CreationProf> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "CREATION D'UN COMPTE PROFESSEUR",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: widget.text,
                    decoration: const InputDecoration(
                      labelText: "Nom du professeur: ",
                    ),
                  ),
                  TextFormField(
                    controller: widget.text,
                    decoration: const InputDecoration(
                      labelText: "Adresse email: ",
                    ),
                  ),
                  TextFormField(
                    controller: widget.text,
                    decoration:
                        const InputDecoration(labelText: 'Numero de bureau: '),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/*Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Choix du niveau"),
                  ),
                  SizedBox(
                    width: 220,
                    height: 120,
                    child: ListView.builder(
                      itemCount: _options.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          leading: Radio(
                            activeColor: const Color.fromARGB(255, 33, 243, 72),
                            value: _options[index],
                            groupValue: niveaux,
                            onChanged: ((value) {
                              setState(() {
                                activate();
                                niveaux.add(index);
                                print(niveaux.length);
                              });
                              widget.selection(index);
                            }),
                          ),
                          title: Text(_options[index]),
                        );
                      }),
                    ),
                  ),*/