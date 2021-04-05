import 'package:flutter/material.dart';
import 'package:response/src/exceptions.dart';

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
  static bool _isPortrait = true;
  static bool _isMobilePortrait = false;
  static double? _screenWidth;
  static double? _screenHeight;
  static double? _blockWidth;
  static double? _blockHeight;
  static double? _fixedHeightFactor;
  static double? _fixedWidthFactor;
  static double? _originalWidth;
  static BuildContext? _context;
  MediaQueryData? _mediaQuery;

  ResponseUI._();

  static ResponseUI _instatnce = ResponseUI._();
  static ResponseUI get instance => _instatnce;

  static void init(
    BoxConstraints constraints,
    Orientation orientation,
    double originalHeight,
    double originalWidth,
    BuildContext currentContext,
  ) {
    _originalWidth = originalWidth;
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      _isPortrait = true;
      if (_screenWidth! < 450) {
        _isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      _isPortrait = false;
      _isMobilePortrait = false;
    }
    _blockHeight = _screenHeight! / 100;
    _blockWidth = _screenWidth! / 100;
    _fixedHeightFactor = originalHeight / 100;
    _fixedWidthFactor = originalWidth / 100;

    _context = currentContext;
  }

  BuildContext? get currentContext => _context;

  ///`isDevicePortrait` is helpful if you want to know whether the device orientation is
  ///in Portrait or in Landscape, it can ably to any device (Tablet or Mobil Phone).
  bool get isDevicePortrait => _isPortrait;

  ///`inMobilePortrait` is helpful if you want to know whether the device you are
  ///working on a Mobile Portrait or a Tablet Portrait mode and you can take action
  ///according to these information ot layout your UI.
  bool get inMobilePortrait => _isMobilePortrait;

  ///`screenWidth` returns the current device screen width.
  ///Note: You can use it instead of `MediaQuery.of(context).size.width`
  double? get screenWidth => _screenWidth;

  ///`screenHeight` returns the current device screen height.
  ///Note: You can use it instead of `MediaQuery.of(context).size.height`
  double? get screenHeight => _screenHeight;

  ///`setWidth` uses its argument `width` to calculate the initial widget width
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

  ///`width` is the widget width which you want it to be the same across any screen size.
  double setWidth(double width) {
    if (_fixedWidthFactor == null || _blockWidth == null || _fixedWidthFactor == null || _originalWidth == null)
      throw DidNotCallInit();
    double _widthCorrectionFactor = _fixedWidthFactor!;
    //if the current device is Mobile
    if (_fixedWidthFactor! < _blockWidth! * 0.6) {
      _widthCorrectionFactor *= 1.48;
    }
    //if the original device is Tablet
    if (_originalWidth! > _screenWidth!) {
      _widthCorrectionFactor /= 1.75;
    }
    return ((width / _widthCorrectionFactor) * _blockWidth!);
  }

  ///`setHeight` uses its argument `height` to calculate the initial widget height
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

  ///`height` is the widget height which you want it to be the same across any screen size.
  double setHeight(double height) {
    if (_fixedHeightFactor == null || _blockHeight == null || _originalWidth == null || _screenWidth == null)
      throw DidNotCallInit();
    double _heightCorrectionFactor = _fixedHeightFactor!;
    //if the original device is Tablet
    if (_originalWidth! > _screenWidth!) {
      _heightCorrectionFactor /= 1.25;
    }
    return ((height / _heightCorrectionFactor) * _blockHeight!);
  }

  ///`setFontSize` uses its argument `fontSize` to calculate the initial text size
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
  ///`fontSize` is the text size which you want it to be the same across any screen size.
  double setFontSize(double fontSize) {
    if (_fixedHeightFactor == null || _blockHeight == null || _originalWidth == null || _screenWidth == null)
      throw DidNotCallInit();
    double _heightCorrectionFactor = _fixedHeightFactor!;
    //if the original device is Tablet
    if (_originalWidth! > _screenWidth!) {
      _heightCorrectionFactor /= 1.2;
    }
    return ((fontSize / _heightCorrectionFactor) * _blockHeight!);
  }

  ///`screenPixelRatio` is a `MediaQuery` function.
  /// The number of device pixels for each logical pixel. This number might not
  /// be a power of two. Indeed, it might not even be an integer. For example,
  /// the Nexus 6 has a device pixel ratio of 3.5.
  double get screenPixelRatio {
    if (_context == null) throw NoContextException();
    try {
      _mediaQuery = MediaQuery.maybeOf(_context!);
      if (_mediaQuery == null) throw NoContextException();
      return _mediaQuery!.devicePixelRatio;
    } catch (e) {
      throw NoContextException();
    }
  }

  /// The number of font pixels for each logical pixel.
  ///
  /// For example, if the text scale factor is 1.5, text will be 50% larger than
  /// the specified font size.
  ///
  /// See also:
  ///
  ///  * [MediaQuery.textScaleFactorOf], a convenience method which returns the
  ///    textScaleFactor defined for a [BuildContext].

  double get textScaleFactor {
    if (_context == null) throw NoContextException();
    try {
      _mediaQuery = MediaQuery.maybeOf(_context!);
      if (_mediaQuery == null) throw NoContextException();
      return _mediaQuery!.textScaleFactor;
    } catch (e) {
      throw NoContextException();
    }
  }

  /// The padding offset from the bottom.
  double get bottomPadding {
    if (_context == null) throw NoContextException();
    try {
      _mediaQuery = MediaQuery.maybeOf(_context!);
      if (_mediaQuery == null) throw NoContextException();
      return _mediaQuery!.padding.bottom;
    } catch (e) {
      throw NoContextException();
    }
  }

  /// The padding offset from the top.
  double get topPadding {
    if (_context == null) throw NoContextException();
    try {
      _mediaQuery = MediaQuery.maybeOf(_context!);
      if (_mediaQuery == null) throw NoContextException();
      return _mediaQuery!.padding.top;
    } catch (e) {
      throw NoContextException();
    }
  }
}
