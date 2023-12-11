import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    required this.colorss,
  });

  GradientContainer.warnaGradient({super.key})
      : colorss = [
          Colors.deepPurple,
          Colors.indigo,
        ];

  final List<Color> colorss;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorss,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
