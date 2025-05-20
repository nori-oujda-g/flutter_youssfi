import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_youssfi/mvc/bloc/contact_bloc.dart';
import 'package:flutter_youssfi/mvc/bloc/contact_event.dart';
import 'package:flutter_youssfi/mvc/bloc/contact_state.dart';

class ContactsPage1111 extends StatelessWidget {
  static const Color defaultColor = Colors.deepOrange;
  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: defaultColor,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    textStyle: TextStyle(fontWeight: FontWeight.bold),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CONTACTS MVC')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<ContactBuilderBloc>().add(
                      FetchBuilderContacts(),
                    );
                  },
                  child: Text('All Contacts'),
                  style: buttonStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ContactBuilderBloc>().add(
                      FetchBuilderContacts(),
                    );
                  },
                  child: Text('Students'),
                  style: buttonStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ContactBuilderBloc>().add(
                      FetchBuilderContacts(),
                    );
                  },
                  child: Text('Developpers'),
                  style: buttonStyle,
                ),
              ],
            ),
          ),
          BlocBuilder<ContactBuilderBloc, ContactState>(
            builder: (context, state) {
              // if (state.requestState == RequestState.LOADING) {
              if (state is ContactLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ContactLoaded) {
                // if (state.requestState == RequestState.LOADED) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.contacts.length,
                    itemBuilder:
                        (context, index) => ListTile(
                          title: Row(
                            children: [Text('${state.contacts[index]}')],
                          ),
                        ),
                  ),
                );
              } else if (state is ContactError) {
                // if (state.requestState == RequestState.ERROR) {
                return Column(
                  children: [
                    Text('Error loading contacts: ${state.message}'),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Retry'),
                      style: buttonStyle,
                    ),
                  ],
                );
              } else {
                return Center(child: Text('Please select a filter'));
              }
            },
          ),
        ],
      ),
    );
  }
}

// ListView(
//                     children: [
//                       ...(state.contacts != null
//                           ? state.contacts!.map(
//                             (contact) => Text(contact.name ?? ''),
//                           )
//                           : [Text('nnn'), Text(';;;')]),
//                     ],
//                   ),
