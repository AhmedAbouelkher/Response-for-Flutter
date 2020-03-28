/*

** Package Author: Ahmed M. Abouelkher
** E-mail: am303737@gmail.com

* Original Author: TechieBlossom
* Github Profile: https://github.com/TechieBlossom

*/

library ui_size_config;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class UISizeConfig extends StatelessWidget {
  ///[UISizeConfig] is an initialization Class for the whole package.
  ///
  ///We are using it to get [constraints] and [orientation] information
  ///about the currently running app.

  UISizeConfig({@required this.context, @required this.child});

  ///`context` is the whole app context with which we are able to get more
  ///information about the app widgets status and more information about our
  ///widget tree as well as our widget status in the same tree.
  ///`context` is a requirement to enable the package to work.
  ///
  /// {@tool sample}
  ///
  /// ```dart
  ///     UISizeConfig(
  ///       context: context,
  ///       child: MaterialApp(
  ///         home: HomePage(),
  ///       ),
  ///     )
  /// ```
  /// {@end-tool}
  ///
  /// Still confused? Run the example app in which you can fine
  /// a working example with full comments to teach you every step
  /// the example: https://github.com/AhmedAbouelkher/UI_SizeConfig-for-Flutter/tree/master/example
  ///
  final BuildContext context;

  ///`child` is the child widget in which we want to use our package
  ///
  ///`child` must be in the top of our (Widget Tree) to work properly.
  ///You can say that your [child] widget is always will be our [MaterialApp]
  ///
  ///`child` is a requirment to enable the package to work.
  ///
  /// {@tool sample}
  ///
  /// ```dart
  ///     UISizeConfig(
  ///       context: context,
  ///       child: MaterialApp(
  ///         home: HomePage(),
  ///       ),
  ///     )
  /// ```
  /// {@end-tool}
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
            SizeConfig()._init(constraints, orientation);
            return child;
          },
        );
      },
    );
  }
}

///
///[SizeConfig] is the main brain of the package.
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

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;
  static bool _isPortrait = true;
  static bool _isMobilePortrait = false;

  void _init(BoxConstraints constraints, Orientation orientation) {
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
    _blockWidth = _screenWidth / 150;
    _blockHeight = _screenHeight / 150;
  }

  ///[isDevicePortrait] is helpful if you want to know whether the device orientation is
  ///in Portrait or in Landscape.
  bool get isDevicePortrait => _isPortrait;

  ///[inMobilePortrait] is helpful if you want to know whether the device you are
  ///working on a Mobile Portrait or a Tablet Portrait mode
  bool get inMobilePortrait => _isMobilePortrait;

  double setWidth(double width) {
    return ((width / _blockWidth) * _blockWidth);
  }

  double setHeight(double height) {
    return ((height / _blockHeight) * _blockHeight);
  }

  double setFontSize(double fontSize) {
    return ((fontSize / _blockHeight) * _blockHeight);
  }

  double setImageSize(double imageSize) {
    return ((imageSize / _blockWidth) * _blockWidth);
  }
}
