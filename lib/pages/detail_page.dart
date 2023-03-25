import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pokemon/model/pokemon.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;
  final Color color;
  const DetailPage({
    super.key,
    required this.pokemon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Pokemon'),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: pokemon.id!,
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.network(pokemon.image!),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
            child: Column(
              children: [
                Text(
                  pokemon.name!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40),
                ),
                const SizedBox(
                  height: 150,
                ),
                const Text(
                  "Base Stats",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Text(
                      "HP : ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 104,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2000,
                        percent: (pokemon.state!.hp! / 100),
                        center: Text(pokemon.state!.hp.toString() + " %"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: const Color.fromRGBO(213, 56, 70, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "ATK : ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 107,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2000,
                        percent: (pokemon.state!.attack! / 100),
                        center: Text(pokemon.state!.attack.toString() + " %"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: const Color.fromRGBO(254, 166, 35, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "DEF : ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 104,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2000,
                        percent: (pokemon.state!.deffense! / 100),
                        center: Text(pokemon.state!.deffense.toString() + " %"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: const Color.fromRGBO(0, 146, 235, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "SPD : ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 107,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2000,
                        percent: (pokemon.state!.speed! / 100),
                        center: Text(pokemon.state!.speed.toString() + " %"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: const Color.fromRGBO(141, 176, 194, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
