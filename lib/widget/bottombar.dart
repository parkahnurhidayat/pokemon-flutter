import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      child: BottomAppBar(
        padding: const EdgeInsets.all(10),
        height: 85,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {},
                child: const Column(
                  children: [
                    Icon(
                      Icons.playlist_add_circle_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                  ],
                )),
            TextButton(
                onPressed: () {},
                child: const Column(
                  children: [
                    Icon(
                      Icons.catching_pokemon_outlined,
                      color: Colors.red,
                      size: 30,
                    ),
                    Text("Pokemon",
                        style: TextStyle(fontSize: 10, color: Colors.red))
                  ],
                )),
            TextButton(
                onPressed: () {},
                child: const Column(
                  children: [
                    Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.black,
                    ),
                  ],
                )),
            TextButton(
                onPressed: () {},
                child: const Column(
                  children: [
                    Icon(
                      Icons.settings_suggest_outlined,
                      color: Colors.black,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
