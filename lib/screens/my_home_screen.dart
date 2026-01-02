import 'dart:math';

import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int leftDice = 1;
  int rightDice = 1;

  void changeDice() { // function to change dice values when user taps on any dice. We created the function to avoid code repetition.
    setState(() { // to change the state of rightDice and leftDice
      rightDice = Random().nextInt(6) + 1; //Random() widget used to generate random number. nextInt(6) generates number from 0 to 5. Because nextInt is inclusive of lower bound and exclusive of upperbound. Which means it includes 0 but excludes 6. nextInt(n) generates number from 0 to n-1, so it returns a random integer from 0 up to but not including n. We add 1 to shift the range from 1 to 6.
      leftDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade500,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text("Dice App"),
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  changeDice(); // calling the function to change dice values
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/dice$leftDice.png"),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: changeDice, // calling the function to change dice values. We can also pass the function directly without using an anonymous function. Just the name of the function is enough. Because there are no parameters to pass. Both ways are correct here.
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/dice$rightDice.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
