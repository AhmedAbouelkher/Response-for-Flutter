import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //initializing Our Package to get data and process them from
    //the general context of the app
    //Both Child and Context is required to initialize the config process
    return Responsive(
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
              //This helps you specifying a constant height in all modes and devices
              //that the app will work on.
              height: ResponseUI().setHeight(30),
            ),
            Container(
              //We want the Container Widget to be 200px in width and 200px in height...
              //across all the available displays on which the app will work on.
              //Note: the scaling process will work also in the same device in both
              //in Portrait mode or in Landscape mode.
              width: ResponseUI().setWidth(200),
              height: ResponseUI().setHeight(200),
              color: Colors.teal,
            ),
            SizedBox(
              height: ResponseUI().setHeight(30),
            ),
            Text(
              'This is a Test Text',
              style: TextStyle(
                //we have defined a fixed font size in pixels
                fontSize: ResponseUI().setFontSize(24),
                fontWeight: FontWeight.bold,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '\nScreen Height: ${ResponseUI().screenHeight}  ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ResponseUI().setFontSize(18),
                    ),
                  ),
                  TextSpan(
                    text: '  Screen Width: ${ResponseUI().screenWidth}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ResponseUI().setFontSize(18)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
