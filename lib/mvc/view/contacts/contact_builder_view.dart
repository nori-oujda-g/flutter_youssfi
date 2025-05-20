import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_youssfi/mvc/bloc/contact_bloc.dart';
import 'package:flutter_youssfi/mvc/bloc/contact_event.dart';
import 'package:flutter_youssfi/mvc/bloc/contact_state.dart';
import 'package:flutter_youssfi/mvc/model/contact.model.dart';

class ContactBuilderView extends StatelessWidget {
  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final profileController = TextEditingController();
  final scoreController = TextEditingController();

  void _showFormDialog(BuildContext context, {Contact? contact}) {
    if (contact != null) {
      nameController.text = contact.name.toString();
      typeController.text = contact.type;
      profileController.text = contact.profile;
      scoreController.text = contact.score.toString();
    } else {
      nameController.clear();
      typeController.clear();
      profileController.clear();
      scoreController.clear();
    }

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(contact == null ? 'Ajouter' : 'Modifier'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'name'),
                ),
                TextField(
                  controller: typeController,
                  decoration: InputDecoration(labelText: 'Type'),
                ),
                TextField(
                  controller: profileController,
                  decoration: InputDecoration(labelText: 'Profil'),
                ),
                TextField(
                  controller: scoreController,
                  decoration: InputDecoration(labelText: 'score'),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  final name = nameController.text;
                  final type = typeController.text;
                  final profile = profileController.text;
                  final score = scoreController.text;
                  if (contact == null) {
                    context.read<ContactBuilderBloc>().add(
                      AddContact(
                        Contact(
                          id: 0,
                          name: name,
                          type: type,
                          profile: profile,
                          score: int.parse(score),
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
                          score: int.parse(score),
                        ),
                      ),
                    );
                  }
                  Navigator.pop(context);
                },
                child: Text(contact == null ? 'Créer' : 'Mettre à jour'),
              ),
            ],
          ),
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
      appBar: AppBar(title: const Text('CRUD avec BLoC builder')),
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
                    title: Text(contact.name),
                    subtitle: Text('${contact}'),
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
              return Center(child: Text('Aucune donnée.'));
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
