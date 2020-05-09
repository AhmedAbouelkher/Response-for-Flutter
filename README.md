# Response

Flutter UI package which will help you to build your responsive UI design as you wanted to be on any device as it recreates every widget to fit the device display size on which the app is working.


![thumbnail](https://github.com/AhmedAbouelkher/Response-for-Flutter/blob/master/screenshots/Combined.jpg)

### Features
- Easy to use, with so few but yet powerful methods.
- Fast, very reliable and readable.
- Saves you a lot of time trying to fit widget size to different displays.
- Works on any Android/ IOS device (including iPad).
- Works in Portrait mode or Landscape mode on the same device.


## How to use
**First** wrap your `MaterialApp` widget with `Response`.

```dart
     Response(
      originalScreenHeight: 759,
      originalScreenWidth: 392,
      child: MaterialApp(
        home: HomePage(),
      ),
    )
```
> **Note:** Responsive needs to be at the top of your **Widget Tree** to be able to work and rebulid the widgets to a new size as the device display changes.

> **Note:** if you want to use any functions features related to `MediaQuery` you **must** change the order to make the `Response` widget a child to the `MaterialApp` widget.

**Second**
declare an instance `response` of `ResponseUI()` class at the top of your file.

```dart
ResponseUI response = ResponseUI();
``` 

And that is all to be able to initialize the package, **Very easy!**


to use the package on your widget you have 4 easy to use methods:

| Name  | Description  |
| ------------ | ------------ |
| `response.setWidth(width)` |  Sets the widget width in pixels value to be relatively constant across all different display sizes. |
| `response.setHeight(height)` | Sets the widget height in pixels value to be relatively constant across all different display sizes. |
| `response.setFontSize(fontSize)` | Sets the text size in pixels to be relativly constant on all diplays sizes. |
| `response.isDevicePortrait` | Helpful if you want to know whether the device orientation is in Portrait or in Landscape.  |
| `response.inMobilePortrait` | Helps you if you want to know whether the device you are working on a Mobile Portrait (returns `true`) or a Tablet Portrait mode (returns `false`).  |
| `response.screenWidth` | returns the current device screen width as of type `double`. |
| `response.screenPixelRatio` | returns the current device screen ratio. (using `MediaQuery`)|
| `response.textScaleFactor` | returns the font scalling factore as of type `double`. (using `MediaQuery`)|
| `response.bottomPadding` | returns the current device screen padding offset from the bottom. (using `MediaQuery`)|
| `response.topPadding` | returns the current device screen padding offset from the top. (using `MediaQuery`)|

> ***Note:*** `isDevicePortrait` and `inMobilePortrait` returns a `bool` (true or false) with which you can know the current orientation state of
your device.

### Height and Width
to set a width and height to for example a Container.

```dart
//We want the Container Widget to be 200px in width and 200px in height
    Container(
        width: response.setWidth(300), //setting the Container width to be 300px
        height: response.setHeight(200), //setting the Container height to be 300px
        color: Colors.teal,
       )
```
**OR**

> ***Only*** for version 2.6.0 or above

```dart
//We want the Container Widget to be 200px in width and 200px in height
    Container(
        width: (300).asWidth, //setting the Container width to be 300px
        height: 200.0.asHieght, //setting the Container height to be 300px
        color: Colors.teal,
       )
```

> ***Note:*** the scaling process will work also in the same device in both
in Portrait mode or in Landscape mode.



### Text Size
to set the text size.

```dart
    Text(
        'This is a Test Text',
        style: TextStyle(
           fontSize: response.setFontSize(24), //defined a fixed font size in pixels
           fontWeight: FontWeight.bold,
    ),
)
```

**OR**

> ***Only*** for version 2.6.0 or above

```dart
    Text(
        'This is a Test Text',
        style: TextStyle(
           fontSize: 24.0.asFontSize, //defined a fixed font size in pixels
           fontWeight: FontWeight.bold,
    ),
)
```

### Getting Screen Width & Height

```dart
    TextSpan(
      text: '\nScreen Height: ${response.screenHeight}px\n', //we are getting back our current device screen 
      //height in pixels.
      style: TextStyle(
        color: Colors.black,
        fontSize: response.setFontSize(18),
      ),
    ),
    TextSpan(
      text: 'Screen Width: ${response.screenWidth}px', //we are getting back our current device screen 
      //width in pixels.
      style: TextStyle(
        color: Colors.black,
        fontSize: response.setFontSize(18),
      ),
    ),
```

## Contributions

If you feel like you can contribute to make the package much better and more useful for other
developers, don't hesitate to `fork` the repo and make `pull request` to your changes.

Source code on Github: [here](https://github.com/AhmedAbouelkher/Responsive-for-Flutter "here")


<!-- ## Some Tricks

If you feel confused or can't understand any part of the code, then the Package
Documentation will be very useful.

You can access any Method/Class Quick Documentation:
  in `VS Code`: By hovering with your cursor over the method/class in your code.

  in `Android Studio/IntelliJ IDEA`: move the cursor pointer to the method/class and type
  on your keyboard (`ctrl + q` on Windows/ `command + j` on MacOS).

You can access any Method/Class Full Detailed Documentation:
  in `VS Code` and `Android Studio/IntelliJ IDEA`:  hovering with your cursor over the method/class in your code while
  pressing (`ctrl` on Windows/ `command` on MacOS) button then click. -->

## Inspired
This package was inspired by [Prateek Sharma](https://github.com/PrateekSharma1712 "Prateek Sharma")'s great custom responsive UI [project](https://medium.com/flutter-community/flutter-responsive-ui-for-learning-platform-app-2df185f86e8e "project").
