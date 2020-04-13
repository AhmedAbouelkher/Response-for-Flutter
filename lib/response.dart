library response;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Response extends StatelessWidget {
  ///[Response] is an initialization Class for the whole package.
  ///
  ///We are using it to get [constraints] and [orientation] information
  ///about the currently running app.

  Response(
      {@required this.child,
      this.originalScreenHeight = 759,
      this.originalScreenWidth = 392});

  ///`originalScreenHeight` is the original device screen height in pixels
  ///on which you designed your origial app layout.
  /// {@tool sample}
  ///
  /// ```dart
  /// Response(
  ///  originalScreenHeight: 759,
  ///  originalScreenWidth: 392,
  ///  child: MaterialApp(
  ///     home: HomePage(),
  ///  ),
  ///)
  /// ```
  /// {@end-tool}
  ///
  final double originalScreenHeight;

  ///`originalScreenWidth` is the original device screen width in pixels
  ///on which you designed your origial app layout.
  ///  /// {@tool sample}
  ///
  /// ```dart
  /// Response(
  ///  originalScreenHeight: 759,
  ///  originalScreenWidth: 392,
  ///  child: MaterialApp(
  ///     home: HomePage(),
  ///  ),
  ///)
  /// ```
  /// {@end-tool}
  ///
  final double originalScreenWidth;

  ///`child` is the child widget in which we want to use our package
  ///
  ///`child` must be in the top of our (Widget Tree) to work properly.
  ///You can say that your [child] widget is always will be our [MaterialApp]
  ///
  ///`child` is a requirment to enable the package to work.
  ///
  /// Still confused? Run the example app in which you can fine
  /// a working example with full comments to teach you every step
  /// the example: https://github.com/AhmedAbouelkher/UI_SizeConfig-for-Flutter/tree/master/example
  ///
  final Widget child;

  @override
  Widget build(BuildContext context) {
    ///[LayoutBuilder] is used to get the constraints/borders geometry of
    ///the device screen in which the app is working on.
    return LayoutBuilder(
      builder: (context, constraints) {
        ///[OrientationBuilder] is used to get the orientation mode of
        ///the device in which the app is working on.
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            ///initializing our brain
            ResponseUI()._init(constraints, orientation, originalScreenHeight,
                originalScreenWidth);
            return child;
          },
        );
      },
    );
  }
}

///
///[ResponseUI] is the main brain of the package.
///
///We are using it to calculate the geometric value of our widgets
///in which we define for example a specific [width] or [height] in pixels
///and in that case we want the specified property to be constant whatever the
///device screen size would be.
///
///For example:
///if you want to specific a constant [height] and [width] to your container
///lets say it will be 100 pixels in height and 100 pixels in width, you will
///type the [height] property = 100 and the [width] property = 100, So in that
///case you want to maintain these [height] and [width] property relative to
///the device screen size you originally designed your app on.
///
/// in that case the class/package will do the work to change these relative
/// [height] and [width] to maintain the same display occupation size.
///
///

class ResponseUI {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;
  static bool _isPortrait = true;
  static bool _isMobilePortrait = false;
  static double _fixedHeightFactor = 0;
  static double _fixedWidthFactor = 0;

  void _init(BoxConstraints constraints, Orientation orientation,
      double originalHeight, double originalWidth) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      _isPortrait = true;
      if (_screenWidth < 450) {
        _isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      _isPortrait = false;
      _isMobilePortrait = false;
    }
    _blockHeight = _screenHeight / 100;
    _blockWidth = _screenWidth / 100;
    _fixedHeightFactor = originalHeight / 100;
    _fixedWidthFactor = originalWidth / 100;
  }

  ///[isDevicePortrait] is helpful if you want to know whether the device orientation is
  ///in Portrait or in Landscape, it can ably to any device (Tablet or Mobil Phone).
  bool get isDevicePortrait => _isPortrait;

  ///[inMobilePortrait] is helpful if you want to know whether the device you are
  ///working on a Mobile Portrait or a Tablet Portrait mode and you can take action
  ///according to these information ot layout your UI.
  bool get inMobilePortrait => _isMobilePortrait;

  ///[screenWidth] returns the current device screen width.
  ///Note: You can use it insted of `MediaQuery.of(context).size.width`
  double get screenWidth => _screenWidth;

  ///[screenHeight] returns the current device screen height.
  ///Note: You can use it insted of `MediaQuery.of(context).size.height`
  double get screenHeight => _screenHeight;

  ///[setWidth] uses its argument [width] to calculate the initial widget width
  ///in pixels and from that the package can deal with all the calculation.
  ///`setWidth`
  /// {@tool sample}
  ///
  /// ```dart
  /// Container(
  ///   width: response.setWidth(300),
  ///   height: response.setHeight(200),
  ///   color: Colors.teal,
  ///  ), //Container
  /// ```
  /// {@end-tool}

  ///[width] is the widget width which you want it initially and finally be the same.
  double setWidth(double width) {
    double _tempFixedWidthFactor = 0;
    if (_fixedWidthFactor < _blockWidth * 0.6) {
      _tempFixedWidthFactor = _fixedWidthFactor * 1.13;
    }
    return ((width / _tempFixedWidthFactor) * _blockWidth);
  }

  ///[setHeight] uses its argument [height] to calculate the initial widget height
  ///in pixels and from that the package can deal with all the calculation.
  ///`setHeight`
  /// {@tool sample}
  ///
  /// ```dart
  /// Container(
  ///   width: response.setWidth(300),
  ///   height: response.setHeight(200),
  ///   color: Colors.teal,
  ///  ), //Container
  /// ```
  /// {@end-tool}
  ///

  double setHeight(double height) {
    ///[height] is the widget height which you want it initially and finally be the same.
    return ((height / _fixedHeightFactor) * _blockHeight);
  }

  ///[setFontSize] uses its argument [fontSize] to calculate the initial text size
  ///in pixels and from that the package can deal with all the calculation.
  ///`setFontSize`
  /// {@tool sample}
  ///
  /// ```dart
  /// Text(
  ///    'This is a Test Text',
  ///     style: TextStyle(
  ///             fontSize: response.setFontSize(24),
  ///             fontWeight: FontWeight.bold,
  ///          ), //TextStyle
  ///       ) //Text
  /// ```
  /// {@end-tool}
  ///

  double setFontSize(double fontSize) {
    ///[fontSize] is the text size which you want it initially and finally be the same.
    return ((fontSize / _fixedHeightFactor) * _blockHeight);
  }
}
