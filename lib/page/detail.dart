import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon/model/pokemon_user.dart';
import 'package:pokemon/widget/appbar.dart';
import 'package:pokemon/service/pokemon_user_service.dart';
import 'package:pokemon/widget/bottombar.dart';

import '../model/pokemon_model.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Future<PokemonUser?> futurePokemonList;
  late String apiUrl;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Result data = ModalRoute.of(context)!.settings.arguments as Result;
    apiUrl = data.url!;
    futurePokemonList = ApiService.fetchUserList(apiUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize:
              Size.fromHeight(56.0), // Sesuaikan dengan tinggi AppBar
          child: MyAppBar(),
        ),
        body: Center(
          child: FutureBuilder<PokemonUser?>(
            future: futurePokemonList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                            Text(
                              capitalize(
                                snapshot.data!.name.toString(),
                              ),
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 59, 255, 216),
                                fontSize: 55,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 120),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _getElementIcon(snapshot),
                                  Text(
                                      capitalize(
                                          '${snapshot.data!.types![0].type!.name}'),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20,
                                      )),
                                ],
                              ),
                            )
                          ])),
                      Column(
                        children: [
                          SvgPicture.network(
                            snapshot.data!.sprites!.other!.dreamWorld!
                                .frontDefault!,
                            height: 300,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                      Transform.translate(
                        offset: const Offset(0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/about',
                                  arguments: snapshot.data,
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 25),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black),
                                child: const Text(
                                  'ABOUT',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 252, 236, 186)
                                            .withOpacity(0.5),
                                        spreadRadius: 5,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color.fromARGB(
                                        255, 237, 247, 95)),
                                child: const Icon(Icons.add)),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 25),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:
                                      const Color.fromARGB(255, 209, 255, 248)),
                              child: const Text(
                                'EVOLUTION',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 54, 244, 200),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Text('Tidak ada data');
              }
            },
          ),
        ),
        bottomNavigationBar: const MyBottomBar());
  }

  Icon _getElementIcon(snapshot) {
    if (snapshot.data!.types![0].type!.name == 'water') {
      return const Icon(Icons.water_drop, color: Colors.blue);
    } else if (snapshot.data!.types![0].type!.name == 'fire') {
      return const Icon(Icons.local_fire_department, color: Colors.red);
    }
    return const Icon(Icons.grid_view_rounded);
  }
}

String capitalize(String text) {
  return text.isNotEmpty ? text[0].toUpperCase() + text.substring(1) : text;
}
