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
      body: SingleChildScrollView(
        child: Center(
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
                      //we are getting back our current device screen height in pixels.
                      text: '\nScreen Height: ${ResponseUI().screenHeight}px\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: ResponseUI().setFontSize(18),
                      ),
                    ),
                    TextSpan(
                      //we are getting back our current device screen width in pixels.
                      text: 'Screen Width: ${ResponseUI().screenWidth}px',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: ResponseUI().setFontSize(18),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RaisedButton.icon(
                  color: Colors.teal,
                  onPressed: () {
                    //checking whether our current working device is in Portrait orientation or not.
                    print("isDevicePortrait: ${ResponseUI().isDevicePortrait}");
                    //checking whether our current working device is in Portrait orientation as a Mobile Phone device
                    //(Not a Tablet) or not.
                    print("inMobilePortrait: ${ResponseUI().inMobilePortrait}");
                  },
                  icon: Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Orientation State',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
