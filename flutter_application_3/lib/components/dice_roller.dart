import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var current = 1;

  void rollDice() {
    setState(() {
      current = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$current.png',
          width: 200,
        ),
        const SizedBox(
          height: 50,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              )),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}
