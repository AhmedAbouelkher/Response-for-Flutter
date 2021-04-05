const String _contextErrorMessage = '''couldn't find context
Context can't equal 'null'
if you want to use any `MediaQuery` related functions, you should set the `Response` widget as a child (home) to the `MaterialApp` widget''';

class NoContextException implements Exception {
  final String message;

  const NoContextException({this.message = _contextErrorMessage});
}

class DidNotCallInit implements Exception {
  final String message;

  const DidNotCallInit({this.message = _contextErrorMessage});
}
