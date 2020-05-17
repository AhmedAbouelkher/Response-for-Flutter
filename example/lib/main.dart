import 'package:flutter/material.dart';
import 'package:response/response.dart';

var response = ResponseUI();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //initializing Our Package to get data and process them from
    //the general context of the app
    //Both Child and Context is required to initialize the config process
    return Response(
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

//To use the [MediaQuery Functions]
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //initializing Our Package to get data and process them from
    //the general context of the app
    //Both Child and Context is required to initialize the config process
    return MaterialApp(
      home: Response(
        child: HomePage(),
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
                height: response.setHeight(30),
              ),
              Container(
                //We want the Container Widget to be 200px in width and 200px in height...
                //across all the available displays on which the app will work on.
                //Note: the scaling process will work also in the same device in both
                //in Portrait mode or in Landscape mode.
                width: response.setWidth(300),
                height: response.setHeight(200),
                color: Colors.teal,
                child: Center(
                  child: Text(
                    "Hello, World!",
                    style: TextStyle(
                      fontSize: response.setFontSize(45),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: response.setHeight(20),
              ),
              Text(
                'This is a Test Text',
                style: TextStyle(
                  //we have defined a fixed font size in pixels
                  fontSize: response.setHeight(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: response.setHeight(20),
              ),
              Text(
                'Testing new Feature',
                style: TextStyle(
                  //we have defined a fixed font size in pixels
                  fontSize: response.setFontSize(24),
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      //we are getting back our current device screen height in pixels.
                      text:
                          '\nScreen Height: ${response.screenHeight.floor()}px\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: response.setFontSize(18),
                      ),
                    ),
                    TextSpan(
                      //we are getting back our current device screen width in pixels.
                      text: 'Screen Width: ${response.screenWidth.floor()}px',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: response.setFontSize(18),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: response.setHeight(20)),
              Container(
                height: response.setHeight(50),
                width: response.setWidth(200),
                child: RaisedButton.icon(
                  color: Colors.teal,
                  onPressed: () {
                    //checking whether our current working device is in Portrait orientation or not.
                    print("isDevicePortrait: ${response.isDevicePortrait}");
                    //checking whether our current working device is in Portrait orientation as a Mobile Phone device
                    //(Not a Tablet) or not.
                    print("inMobilePortrait: ${response.inMobilePortrait}");
                    // print("screenPixelRatio: ${response.screenPixelRatio}");
                  },
                  icon: Icon(
                    Icons.info,
                    color: Colors.white,
                    size: response.setHeight(20),
                  ),
                  label: Text(
                    'Orientation State',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: response.setFontSize(18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
