import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChartCard extends StatefulWidget {
  String message;
  ChartCard(this.message, {super.key});

  @override
  State<ChartCard> createState() => _ChartCardState();
}

class _ChartCardState extends State<ChartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, bottom: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(25))),
      child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: Text(
            widget.message,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                decoration: TextDecoration.none),
          )),
    );
  }
}
