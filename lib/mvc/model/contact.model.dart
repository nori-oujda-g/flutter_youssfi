enum Type { Developper, Doctor, Student, Builder, Professor }

List<String> types = Type.values.map((e) => e.name).toList();
Type TypeFromString(String type) {
  return Type.values.firstWhere(
    (e) => e.toString().split('.').last.toLowerCase() == type.toLowerCase(),
    orElse: () => throw ArgumentError('Invalid type: $type'),
  );
}

enum Profile { PP, TT, CC, ZZ, WW }

List<String> profiles = Profile.values.map((e) => e.name).toList();
Profile ProfileFromString(String profil) {
  return Profile.values.firstWhere(
    (e) => e.toString().split('.').last.toLowerCase() == profil.toLowerCase(),
    orElse: () => throw ArgumentError('Invalid type: $profil'),
  );
}

class Contact {
  final int id;
  final String name;
  final Type type;
  final Profile profile;
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
      type: TypeFromString(json['type']),
      profile: ProfileFromString(json['profile']),
      score: json['score'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type.name,
      'profile': profile.name,
      'score': score,
    };
  }
}
