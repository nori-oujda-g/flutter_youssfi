// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_youssfi/mvc/model/contact.model.dart';
// import 'package:flutter_youssfi/mvc/repositories/contacts.repo.dart';

// abstract class ContactsEvent {}

// enum RequestState { LOADING, LOADED, ERROR, NONE }

// class LoadAllContactsEvent extends ContactsEvent {}

// class LoadStudentsEvent extends ContactsEvent {}

// class LoadDeveloppersEvent extends ContactsEvent {}

// class ContactsState {
//   final List<Contact> contacts;
//   final RequestState requestState;
//   String? errorMessage;
//   ContactsState({
//     required this.contacts,
//     required this.requestState,
//     this.errorMessage,
//   });
// }

// class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
//   final ContactsRepository contactsRepositoty;
//   ContactsBloc(this.contactsRepositoty)
//     : super(
//         ContactsState(
//           contacts: [],
//           requestState: RequestState.NONE,
//           errorMessage: null,
//         ),
//       ) {
//     on<ContactsEvent>((event, emit) async* {
//       if (event is LoadAllContactsEvent) {
//         emit(
//           ContactsState(
//             contacts: state.contacts,
//             requestState: RequestState.LOADING,
//           ),
//         );
//         try {
//           List<Contact> data = await contactsRepositoty.getContacts();
//           emit(
//             ContactsState(contacts: data, requestState: RequestState.LOADED),
//           );
//         } catch (e) {
//           emit(
//             ContactsState(
//               contacts: state.contacts,
//               requestState: RequestState.ERROR,
//               errorMessage: ' errrr: ' + e.toString(),
//             ),
//           );
//         }
//       } else if (event is LoadStudentsEvent) {
//       } else if (event is LoadDeveloppersEvent) {}
//     });
//   }
// }
// La variable state dans la classe ContactsBloc provient de la classe parente Bloc<ContactsEvent, ContactsState> du package flutter_bloc.
// Dans un Bloc, state représente l’état courant du Bloc. Il est automatiquement géré par la classe Bloc et accessible dans toutes les méthodes et callbacks du Bloc.
// Tu n’as pas besoin de le déclarer : il est fourni par la classe de base.
  // ContactsBloc()
  //   : super(
  //       ContactsState(
  //         contacts: [],
  //         requestState: RequestState.NONE,
  //         errorMessage: null,
  //       ),
  //     ) {
  //   on<ContactsEvent>((event, emit) {
  //     if (event is LoadAllContactsEvent) {
  //       emit(ContactsState(contacts: state.contacts));
  //     } else if (event is LoadStudentsEvent) {
  //     } else if (event is LoadDeveloppersEvent) {}
  //   });
  // }

