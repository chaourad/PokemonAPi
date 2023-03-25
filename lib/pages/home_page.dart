import 'dart:math';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/api/pokemon_api.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/pages/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PokemonApi pokemonApi = PokemonApi();

    List<Color> colorList = [
      const Color.fromRGBO(240, 201, 207, 1),
      const Color.fromRGBO(196, 212, 134, 1),
      const Color.fromRGBO(198, 159, 166, 1),
      const Color.fromRGBO(157, 108, 156, 1),
      const Color.fromRGBO(95, 136, 183, 1),
      const Color.fromRGBO(215, 112, 95, 1),
      const Color.fromRGBO(183, 175, 150, 1),
      const Color.fromRGBO(71, 143, 127, 1),
      const Color.fromRGBO(238, 207, 151, 1),
      const Color.fromRGBO(111, 185, 199, 1),
    ];
    Random random = Random();

    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              child: Image.network(
                  'https://cdn.pixabay.com/photo/2019/11/27/14/06/pokemon-4657023__480.png'),
            ),
          ],
        ),
        title: const Text('Pokemon'),
        backgroundColor: const Color.fromRGBO(213, 56, 70, 1),
      ),
      backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
      body: FutureBuilder<List<Pokemon>>(
        future: pokemonApi.getPokemon(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 5 / 6,
                ),
                itemBuilder: (context, index) {
                  Pokemon pokemon = snapshot.data![index];
                  Color color = colorList[random.nextInt(colorList.length)];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            pokemon: pokemon,
                            color: color,
                          ),
                        ),
                      );
                    },
                    child: DelayedDisplay(
                      fadeIn: true,
                      fadingDuration: const Duration(
                        milliseconds: 600,
                      ),
                      slidingCurve: Curves.ease,
                      delay: Duration(
                        milliseconds: 200 + index * 10,
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(-1, 2),
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                              height: 150,
                              child: Hero(
                                  tag: pokemon.id!,
                                  child: Image.network(pokemon.image!)),
                            ),
                            Text(
                              pokemon.name!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
