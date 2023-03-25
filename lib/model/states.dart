// ignore_for_file: public_member_api_docs, sort_constructors_first
class State {
  int? hp;
  int? attack;
  int? deffense;
  int? specialAttack;
  int? specialDeffense;
  int? speed;

  State({
    this.hp,
    this.attack,
    this.deffense,
    this.specialAttack,
    this.specialDeffense,
    this.speed,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        hp: json['HP'],
        attack: json['attack'],
        specialAttack: json['special_attack'],
        deffense: json['defense'],
        specialDeffense: json['special_defense'],
        speed: json['speed'],
      );
}
