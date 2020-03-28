import 'package:flutter/material.dart';
import 'package:ui_size_config/ui_size_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UISizeConfig(
      context: context,
      child: MaterialApp(home: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: SizeConfig().setWidth(200),
                  height: SizeConfig().setHeight(200),
                  color: Colors.teal,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'This a test Text',
                  style: TextStyle(
                      fontSize: SizeConfig().setFontSize(24),
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
