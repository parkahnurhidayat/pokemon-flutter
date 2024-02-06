import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pokemon/model/pokemon_user.dart';
import 'package:pokemon/widget/appbar.dart';
import 'package:pokemon/widget/bottombar.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    PokemonUser data =
        ModalRoute.of(context)!.settings.arguments as PokemonUser;
    return Scaffold(
      backgroundColor: const Color.fromARGB(225, 116, 251, 231),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56.0), // Sesuaikan dengan tinggi AppBar
        child: MyAppBar(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 36, 245, 196),
              Color.fromARGB(255, 2, 222, 171)
            ],
            begin: Alignment.bottomRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Expanded(
              child: Transform.translate(
                offset: const Offset(0, 100),
                child: ClipPath(
                  clipper: CurvedClipper(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    color: const Color.fromARGB(100, 174, 245, 226),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 120,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'About',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Row(
                              children: [
                                Text('All',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 12,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Icon(Icons.bolt,
                                      color: Colors.yellow[500], size: 30),
                                  Text(capitalize(
                                      data.stats![1].stat!.name.toString())),
                                  Text(
                                    data.stats![1].baseStat.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  const Icon(Icons.shield_outlined,
                                      color: Color.fromARGB(255, 8, 234, 250),
                                      size: 30),
                                  Text(capitalize(
                                      data.stats![2].stat!.name.toString())),
                                  Text(data.stats![2].baseStat.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20))
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Icon(Icons.health_and_safety_outlined,
                                      color: Colors.green[500], size: 30),
                                  Text(capitalize('Health')),
                                  Text(data.stats![0].baseStat.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20))
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  const Icon(Icons.speed,
                                      color: Color.fromARGB(255, 202, 13, 236),
                                      size: 30),
                                  Text(capitalize(
                                      data.stats![5].stat!.name.toString())),
                                  Text(data.stats![5].baseStat.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20))
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              )),
                          height: 230,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Where to catch ${data.name}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20),
                                ),
                                Text(
                                  'You can get ${data.name} Pokemon from 2 km eggs, and  there also a chance to catch it. You can catch  ${data.name} at very beginning of the game ,when the first 3 pokemons appear on the map.',
                                  textAlign: TextAlign.center,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 25),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color.fromARGB(
                                              255, 209, 255, 244)),
                                      child: const Text(
                                        'TO FAVORITES',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 54, 244, 206),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 25),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.teal,
                                      ),
                                      child: const Text(
                                        'EVOLUTION',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 209, 255, 245),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, 30),
              child: SvgPicture.network(
                data.sprites!.other!.dreamWorld!.frontDefault.toString(),
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}

String capitalize(String text) {
  return text.isNotEmpty ? text[0].toUpperCase() + text.substring(1) : text;
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.1); // Starting point
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.005, size.width, size.height * 0.1);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
