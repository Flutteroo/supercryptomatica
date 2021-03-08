import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supercryptomatica/components/counter.dart';
import 'package:supercryptomatica/components/monitored_button.dart';
import 'package:vibration/vibration.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(SuperCryptoMatica()));
}

class SuperCryptoMatica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.orange, accentColor: Colors.orangeAccent),
      home: MaticaPage(),
    );
  }
}

class MaticaPage extends StatefulWidget {
  MaticaPage({Key key}) : super(key: key);

  @override
  _MaticaPageState createState() => _MaticaPageState();
}

class _MaticaPageState extends State<MaticaPage> {
  int _counter = 0;

  void _incrementCounter() async {
     Vibration.vibrate(amplitude: 64);
    setState(() {
      _counter++;
    });
  }

  bool canPress(){
    return (_counter < 3);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
              image: new AssetImage('lib/assets/background.png'))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 62),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    GestureDetector(
                        child: Counter(_counter),
                        onTap: () => _incrementCounter()),
                    SizedBox(height: 8),
                    MonitoredButton(callback: _incrementCounter, monitor: canPress)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
