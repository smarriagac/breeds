part of 'http.dart';

@visibleForTesting
bool showHttpErros = true;

void _printLogs(Map<String, dynamic> logs, StackTrace? stackTrace) {
  if (kDebugMode) {
    // coverage:ignore-start
    if (Platform.environment.containsKey('FLUTTER_TEST') &&
        logs.containsKey('exception') &&
        showHttpErros) {
      print(
        const JsonEncoder.withIndent(' ').convert(logs),
      );
    }
    // coverage:ignore-end
    log(
      '''
---------------------------------------------------------
=========================================================
${const JsonEncoder.withIndent('  ').convert(logs)}
=========================================================
---------------------------------------------------------
''',
      stackTrace: stackTrace,
    );
  }
}
