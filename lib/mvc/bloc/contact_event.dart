import 'package:equatable/equatable.dart';
import 'package:flutter_youssfi/mvc/model/contact.model.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();
}

class FetchBuilderContacts extends ContactEvent {
  @override
  List<Object?> get props => [];
}

class AddContact extends ContactEvent {
  final Contact contact;

  AddContact(this.contact);
  @override
  List<Object?> get props => [contact];
}

class UpdateContact extends ContactEvent {
  final Contact contact;

  UpdateContact(this.contact);
  @override
  List<Object?> get props => [contact];
}

class DeleteContact extends ContactEvent {
  final int id;

  DeleteContact(this.id);
  @override
  List<Object?> get props => [id];
}
