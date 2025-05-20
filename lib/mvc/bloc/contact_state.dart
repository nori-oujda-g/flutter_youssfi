import 'package:equatable/equatable.dart';
import 'package:flutter_youssfi/mvc/model/contact.model.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object?> get props => [];
}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactLoaded extends ContactState {
  final List<Contact> contacts;

  ContactLoaded(this.contacts);
  @override
  List<Object?> get props => [contacts];
}

class ContactError extends ContactState {
  final String message;

  ContactError(this.message);
  @override
  List<Object?> get props => [message];
}

class ContactActionSuccess extends ContactState {}
