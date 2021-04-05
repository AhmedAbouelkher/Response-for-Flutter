import 'package:flutter/material.dart';
import 'package:response/src/exceptions.dart';
import 'package:response/src/response_ui.dart';

extension Responsive on num {
  double asHeight(BuildContext context) {
    final _instance = ResponseUI.instance;
    if (_instance.currentContext == null) throw NoContextException();
    return _instance.setHeight(this.toDouble());
  }

  double asWidth(BuildContext context) {
    final _instance = ResponseUI.instance;
    if (_instance.currentContext == null) throw NoContextException();
    return _instance.setWidth(this.toDouble());
  }

  double asFontSize(BuildContext context) {
    final _instance = ResponseUI.instance;
    if (_instance.currentContext == null) throw NoContextException();
    return _instance.setFontSize(this.toDouble());
  }
}
