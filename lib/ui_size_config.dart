library ui_size_config;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class UISizeConfig extends StatelessWidget {
  final BuildContext context;
  final Widget child;
  UISizeConfig({@required this.context, @required this.child});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            SizeConfig().init(constraints, orientation);
            return child;
          },
        );
      },
    );
  }
}

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;
  static bool _isPortrait = true;
  static bool _isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
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

  bool get isDevicePortait => _isPortrait;
  bool get inMobilePortrait => _isMobilePortrait;

  double setWidth(double width) => ((width / _blockWidth) * _blockWidth);

  double setHeight(double height) => ((height / _blockHeight) * _blockHeight);

  double setFontSize(double fontSize) =>
      ((fontSize / _blockHeight) * _blockHeight);

  double setImageSize(double imageSize) =>
      ((imageSize / _blockWidth) * _blockWidth);
}
