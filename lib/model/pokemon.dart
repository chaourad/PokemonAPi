// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:pokemon/model/states.dart';

class Pokemon {
  int? id;
  String? name;
  String? image;
  State? state;

  Pokemon({
    this.id,
    this.name,
    this.image,
    this.state,
  });

  factory Pokemon.toJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      state: State.fromJson(json['stats']),
    );
  }
}
