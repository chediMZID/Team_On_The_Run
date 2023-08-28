

class Channel {
  final String id;
  final String name;
  final int priorityLevel;
  final int usersNumber;
  final int connectedUsersNumber;
  bool isOpen;

  Channel({this.isOpen = false,
    required this.name,
    required this.priorityLevel,
    required this.usersNumber,
    required this.connectedUsersNumber,
    required this.id,

  });

  factory Channel.fromJson(Map<String,dynamic> json){
    return Channel(
        isOpen: json['isOpen'],
        name: json['nom_channel'],
        priorityLevel: json['Priority'],
        usersNumber: json['nombre_user_dans_channel'],
        connectedUsersNumber: json['nombre_user_connectes'],
        id: json['id_channel']
    );
  }
}