import 'package:flutter/material.dart';

class MonitoredButton extends StatefulWidget {
  final Function callback;
  final Function monitor;

  MonitoredButton({Key key, this.callback, this.monitor}) : super(key: key);

  @override
  MonitoredButtonState createState() => MonitoredButtonState();
}

class MonitoredButtonState extends State<MonitoredButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    void buttonPressed() {
      widget.callback();
    }

    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Text(widget.monitor() ? '🟢' : '🟠'),
          IconButton(

            iconSize: 45,
            color: Colors.blueGrey,
            disabledColor: Colors.blueGrey[700],
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(Icons.circle),
            onPressed: widget.monitor() ? () => buttonPressed() : null
          ),
        ],
      ),
    );
  }
}

