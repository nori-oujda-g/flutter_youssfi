import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_youssfi/mvc/env.dart';
import 'package:flutter_youssfi/mvc/model/contact.model.dart';
import 'package:http/http.dart' as http;

import 'contact_event.dart';
import 'contact_state.dart';

class ContactBuilderBloc extends Bloc<ContactEvent, ContactState> {
  ContactBuilderBloc() : super(ContactInitial()) {
    on<FetchBuilderContacts>(_onFetchBuilderContacts);
    on<AddContact>(_onAddContact);
    on<UpdateContact>(_onUpdateContact);
    on<DeleteContact>(_onDeleteContact);
  }

  Future<void> _onFetchBuilderContacts(
    FetchBuilderContacts event,
    Emitter<ContactState> emit,
  ) async {
    emit(ContactLoading());
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final contacts = data.map((json) => Contact.fromJson(json)).toList();
        emit(ContactLoaded(contacts));
      } else {
        emit(ContactError('Erreur lors du chargement'));
      }
    } catch (e) {
      emit(ContactError(e.toString()));
    }
  }

  Future<void> _onAddContact(
    AddContact event,
    Emitter<ContactState> emit,
  ) async {
    try {
      await http.post(
        Uri.parse(baseUrl),
        body: json.encode(event.contact.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
      emit(ContactActionSuccess());
      add(FetchBuilderContacts());
    } catch (e) {
      emit(ContactError(e.toString()));
    }
  }

  Future<void> _onUpdateContact(
    UpdateContact event,
    Emitter<ContactState> emit,
  ) async {
    try {
      await http.put(
        Uri.parse('$baseUrl/${event.contact.id}'),
        body: json.encode(event.contact.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
      emit(ContactActionSuccess());
      add(FetchBuilderContacts());
    } catch (e) {
      emit(ContactError(e.toString()));
    }
  }

  Future<void> _onDeleteContact(
    DeleteContact event,
    Emitter<ContactState> emit,
  ) async {
    try {
      await http.delete(Uri.parse('$baseUrl/${event.id}'));
      emit(ContactActionSuccess());
      add(FetchBuilderContacts());
    } catch (e) {
      emit(ContactError(e.toString()));
    }
  }
}
