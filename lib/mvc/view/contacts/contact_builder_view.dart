// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_youssfi/mvc/bloc/contact_bloc.dart';
import 'package:flutter_youssfi/mvc/bloc/contact_event.dart';
import 'package:flutter_youssfi/mvc/bloc/contact_state.dart';
import 'package:flutter_youssfi/mvc/model/contact.model.dart';

class ContactBuilderView extends StatefulWidget {
  @override
  State<ContactBuilderView> createState() => _ContactBuilderViewState();
}

class _ContactBuilderViewState extends State<ContactBuilderView> {
  final nameController = TextEditingController();
  // final typeController = TextEditingController();
  // final profileController = TextEditingController();
  final scoreController = TextEditingController();
  String selectedType = types[0];
  String selectedProfil = profiles[0];

  void _showFormDialog(BuildContext context, {Contact? contact}) {
    if (contact != null) {
      nameController.text = contact.name.toString();
      // typeController.text = contact.type.toString();
      selectedType = contact.type.name;
      selectedProfil = contact.profile.name;
      // profileController.text = contact.profile.toString();
      scoreController.text = contact.score.toString();
    } else {
      nameController.clear();
      // typeController.clear();
      // profileController.clear();
      scoreController.clear();
      selectedType = types[0];
      selectedProfil = profiles[0];
    }

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text(contact == null ? 'Ajouter' : 'Modifier'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'name'),
                  ),
                  // TextField(
                  //   controller: typeController,
                  //   decoration: InputDecoration(labelText: 'Type'),
                  // ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(labelText: 'Type'),
                    icon: Icon(Icons.arrow_downward),
                    value: selectedType,
                    isExpanded: true,
                    items:
                        types.map<DropdownMenuItem<String>>((String valeur) {
                          return DropdownMenuItem<String>(
                            value: valeur,
                            child: Text(valeur),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        setStateDialog(() {
                          selectedType = newValue!;
                        });
                      });
                    },
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(labelText: 'Profil'),
                    icon: Icon(Icons.arrow_downward),
                    value: selectedProfil,
                    isExpanded: true,
                    items:
                        profiles.map<DropdownMenuItem<String>>((String valeur) {
                          return DropdownMenuItem<String>(
                            value: valeur,
                            child: Text(valeur),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        setStateDialog(() {
                          selectedProfil = newValue!;
                        });
                      });
                    },
                  ),
                  // TextField(
                  //   controller: profileController,
                  //   decoration: InputDecoration(labelText: 'Profil'),
                  // ),
                  TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    controller: scoreController,
                    decoration: InputDecoration(labelText: 'score'),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    final String name = nameController.text;
                    // final Type type = TypeFromString(typeController.text);
                    final Type type = TypeFromString(selectedType);
                    final Profile profile = ProfileFromString(selectedProfil);
                    // final Profile profile = ProfileFromString(
                    //   profileController.text,
                    // );
                    final int score = int.parse(scoreController.text);
                    if (contact == null) {
                      context.read<ContactBuilderBloc>().add(
                        AddContact(
                          Contact(
                            id: 0,
                            name: name,
                            type: type,
                            profile: profile,
                            score: score,
                          ),
                        ),
                      );
                    } else {
                      context.read<ContactBuilderBloc>().add(
                        UpdateContact(
                          Contact(
                            id: contact.id,
                            name: name,
                            type: type,
                            profile: profile,
                            score: score,
                          ),
                        ),
                      );
                    }
                    Navigator.pop(context);
                  },
                  child: Text(contact == null ? 'Créer' : 'Mettre à jour'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void confirmeDelete(BuildContext context, int id) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Êtes-vous sûr de vouloir supprimer ?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Annuler'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text('Confirmer'),
              onPressed: () {
                context.read<ContactBuilderBloc>().add(DeleteContact(id));
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CRUD avec BLoC builder selectedType = ${selectedType} selectedProfil= $selectedProfil ',
        ),
      ),
      body: BlocListener<ContactBuilderBloc, ContactState>(
        listener: (context, state) {
          if (state is ContactError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is ContactActionSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Succès de l\'action !')));
          }
        },
        child: BlocBuilder<ContactBuilderBloc, ContactState>(
          builder: (context, state) {
            if (state is ContactLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ContactLoaded) {
              return ListView.builder(
                itemCount: state.contacts.length,
                itemBuilder: (context, index) {
                  final contact = state.contacts[index];
                  return ListTile(
                    // title: Text(contact.name),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.amber,
                              child: Text('${contact.profile.name}'),
                            ),
                            SizedBox(width: 12),
                            Text('${contact}'),
                          ],
                        ),

                        // Text('${contact.type}'),
                        CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Text('${contact.score}'),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed:
                              () => _showFormDialog(context, contact: contact),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            confirmeDelete(context, contact.id);
                          },
                          //  => context.read<ContactBuilderBloc>().add(
                          //   DeleteContact(contact.id),
                          // )
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text('Aucune donnée1 :${state.toString()}'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFormDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
