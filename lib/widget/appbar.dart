import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 2, 222, 171),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          )),
      title: Image.network(
        'https://logos-world.net/wp-content/uploads/2020/05/Pokemon-Logo.png',
        scale: 35,
      ),
      actions: [
        Image.asset('assets/pokeball.png'),
      ],
      centerTitle: true,
    );
  }
}
