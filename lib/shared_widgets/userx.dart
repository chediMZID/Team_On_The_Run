

import '../features/contacts/presentation/view_model/home_view_model.dart';

class UserX {
  final String id;
  final String name;
  final String lastMessage;
  final String dateHourLastMessage;
  final ConnectionStatus status;
  final int messageNonVu;
  final String urlImage;
  final int? priority;
  final int number;
  final bool seen;

  UserX({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.dateHourLastMessage,
    required this.status,
    required this.messageNonVu,
    required this.urlImage,
    required this.priority,
    required this.number,
    required this.seen,
  });

  factory UserX.fromJson(Map<String, dynamic> json) {
    return UserX(
      id: json['id'],
      name: json['NomPrenon'],
      lastMessage: json['LastMessage'],
      dateHourLastMessage: json['datehourLastmessage'],
      status: json['etatConneter'] == 0 ? ConnectionStatus.disconnected
          : json['etatConneter'] == 1 ? ConnectionStatus.connected
          : json['etatConneter'] == 2 ? ConnectionStatus.busy
          : ConnectionStatus.out,
      messageNonVu: json['messagenonvu'],
      urlImage: json['urlimage'],
      priority: json['Priority'],
      number: json['Num_Tel'],
      seen: json['seen'],
    );
  }
/*
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'NomPrenon': name,
      'LastMessage': lastMessage,
      'datehourLastmessage': dateHourLastMessage,
      'etatConneter': status,
      'messagenonvu': messageNonVu,
      'urlimage': urlImage,
      'Priority': priority,
      'Num_Tel': number,
      'seen': seen,
    };
  }*/
}