class Contact {
  final int id;
  final String name;
  final String type;
  final String profile;
  final int score;
  Contact({
    required this.id,
    required this.name,
    required this.type,
    required this.profile,
    required this.score,
  });
  @override
  String toString() {
    return 'id= $id , name= $name , type= $type , profile= $profile , score= $score';
  }

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      profile: json['profile'],
      score: json['score'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'type': type, 'profile': profile, 'score': score};
  }
}
