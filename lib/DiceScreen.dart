import 'package:flutter/material.dart';
import 'dart:math';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int diceOneVal = 3;
  int diceTwoVal = 6;
  bool changeColor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: changeColor ? Colors.grey[200] : Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "ROLL THE DICE!",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor:
            changeColor ? Colors.blueGrey[200] : Colors.blueGrey[900],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                    flex: 1, child: Image.asset("Images/dice$diceOneVal.png")),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    flex: 1, child: Image.asset("Images/dice$diceTwoVal.png"))
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RawMaterialButton(
            onPressed: () {
              setState(() {
                diceOneVal = Random().nextInt(6) + 1;
                diceTwoVal = Random().nextInt(6) + 1;
              });
            },
            child: Text("Roll Dice"),
            fillColor: Colors.white,
            hoverColor: Colors.grey[300],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: changeColor ? Colors.blueGrey[200] : Colors.blueGrey[900],
            child: Text(
              "Sum = ${diceOneVal + diceTwoVal}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                changeColor = !changeColor;
              });
            },
            icon: Icon(
              changeColor ? Icons.dark_mode : Icons.light_mode,
              color: Colors.white,
              size: 15,
            ),
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                    changeColor ? Colors.blueGrey[200] : Colors.blueGrey[900]),
                padding: WidgetStatePropertyAll(EdgeInsets.all(15))),
          ),
        ],
      ),
    );
  }
}
