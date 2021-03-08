import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Counter extends StatefulWidget {
  final int count;
  Counter(this.count);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),
      child: SizedBox(
          width: 52,
          height: 42,
          child: Center(
            child: Text(
              widget.count.toString(),
              style: GoogleFonts.inconsolata(
                textStyle: TextStyle(
                  fontSize: 24,
                  color: Colors.white70,
                  decoration: TextDecoration.none
                ),
              ),
            ),
          )),
    );
  }
}
