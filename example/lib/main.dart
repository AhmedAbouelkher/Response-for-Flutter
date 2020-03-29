import 'package:flutter/material.dart';
import 'package:ui_size_config/ui_size_config.dart';

/*
The app documintaion will be very helpful to know more about any Method/Function
which I use in the package.

If you feel confused or can't understant any part of the code, then the Package 
Documention will be very useful.

You can access any Method/Class Quick Documintation:
  in VS Code: By hovering with your cursor over the method/class in your code.

  in Andriod Studio/IntelliJ IDEA: move the cursor pointer to the method/class and type
  on your keyboard (ctrl + q on Windows/ command + j on MacOS).

You can access any Method/Class Full Detailed Documintation:
  in VS Code and Andriod Studio/IntelliJ IDEA:  hovering with your cursor over the method/class in your code while
  pressing (ctrl on Windows/ command on MacOS) botton then click.

*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //initializing Our Package to get data and process them from
    //the general context of the app
    //Both Child and Context is required to initialize the config process
    return UISizeConfig(
      //passing the context.
      context: context,
      //setting our whole material app as a child.
      //see the documintaion if you want to know more.
      child: MaterialApp(
        home: HomePage(),
      ),
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              //We are just want the SizedBox to be 30px in all situations and screens.
              //This helps you specifing a constant height in all modes and devices
              //that the app will work on.
              height: SizeConfig().setHeight(30),
            ),
            Container(
              //We want the Container Widget to be 200px in width and 200px in height...
              //across all the available displays on which the app will work on.
              //Note: the scaling process will work also in the same device in both
              //in Portrait mode or in Landscape mode.
              width: SizeConfig().setWidth(200),
              height: SizeConfig().setHeight(200),
              color: Colors.teal,
            ),
            SizedBox(
              height: SizeConfig().setHeight(30),
            ),
            Text(
              'This is a Test Text',
              style: TextStyle(
                fontSize: SizeConfig().setFontSize(24),
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

bool ro() {
  return SizeConfig().inMobilePortrait;
}