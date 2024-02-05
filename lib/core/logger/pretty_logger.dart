import 'package:logger/logger.dart';

class PrettyLogger {
  static final logger = Logger(printer: PrettyPrinter(lineLength: 200));
}
