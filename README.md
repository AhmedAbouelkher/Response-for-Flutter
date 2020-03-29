# Responsive

Flutter package will help you to build  your responsive UI design as you wanted to be on any device as it recreates every widget to fit the device display size on which the app is working.

### Features
- Easy to use [with so few methods to use].
- Fast, very reliable and readable.
- Saves a lot of time trying to fit widget size to different displays.
- Works on any Android/ IOS device (including iPad).
- Works in Portrait mode or Landscape mode on the same device.


## How to use
**First** wrap your MaterialApp widget with Responsive.

```dart
    Responsive(
      child: MaterialApp(
        home: HomePage(),
      ),
    )
```

> **Note:** Responsive needs to be at the top of your widget tree to be able to work and rebulid the widgets to a new size as the device display changes

And that is all to be able to initialize the package. Very easy!


**Second** to use the package on your widget you have 4 easy to use methods:

| Name  | Description  |
| ------------ | ------------ |
| Response().setWidth(double width)  |  Sets the widget width in pixels value to be relatively constant across all different display sizes. |
| Response().setHeight(double height)  | Sets the widget height in pixels value to be relatively constant across all different display sizes. |
| Response().setFontSize(double fontSize)  | Sets the text size in pixels to be relativly constant on all diplays sizes. |
| Response().isDevicePortrait  | Helpful if you want to know whether the device orientation is in Portrait or in Landscape.  |
| Response().inMobilePortrait   | Helps you if you want to know whether the device you are working on a Mobile Portrait or a Tablet Portrait mode.  |

> ***Note:*** isDevicePortrait and inMobilePortrait returns a bool (true or false).

### Example Code 1
to set a width and height to a Container.

```dart
//We want the Container Widget to be 200px in width and 200px in height
Container(
	width: Response().setWidth(300), //setting the Container width to be 300px
	height: Response().setHeight(200), //setting the Container height to be 300px
	color: Colors.red,
)
```
> ***Note:*** the scaling process will work also in the same device in both
in Portrait mode or in Landscape mode.

### Example Code 2 
to set the text size.

```dart
Text(
	'This is a Test Text',
	style: TextStyle(
		fontSize: Response().setFontSize(24), //defined a fixed font size in pixels
		fontWeight: FontWeight.bold,
	),
)
```