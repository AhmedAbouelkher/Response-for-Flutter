library response;

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:response/src/response_ui.dart';

class Response extends StatelessWidget {
  ///[Response] is an initialization Class for the whole package.
  ///
  ///We are using it to get [constraints] and [orientation] information
  ///about the currently running app.

  Response({
    required this.child,
    this.originalScreenHeight = 759,
    this.originalScreenWidth = 392,
  });

  ///`originalScreenHeight` is the original device screen height in pixels
  ///on which you designed your original app layout.
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
  ///on which you designed your original app layout.
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
  final double originalScreenWidth;

  ///`child` is the child widget in which we want to use our package
  ///
  ///`child` must be in the top of our (Widget Tree) to work properly.
  ///You can say that your `child` widget is always will be our `MaterialApp` or the [home] widget
  ///if you wanted to use the `MediaQuery` related functions with this package
  ///
  ///`child` is a requirement to enable the package to work.
  ///
  /// Still confused? Run the example app in which you can fine
  /// a working example with full comments to teach you every step
  /// the example: https://github.com/AhmedAbouelkher/UI_SizeConfig-for-Flutter/tree/master/example
  ///
  final Widget child;

  @override
  Widget build(BuildContext context) {
    ///`LayoutBuilder` is used to get the constraints/borders geometry of
    ///the device screen in which the app is working on.
    return LayoutBuilder(
      builder: (context, constraints) {
        ///`OrientationBuilder` is used to get the orientation mode of
        ///the device in which the app is working on.
        return OrientationBuilder(
          builder: (context, orientaton) {
            ResponseUI.init(constraints, orientaton, originalScreenHeight, originalScreenWidth, context);
            return child;
          },
        );
      },
    );
  }
}
