import 'package:flutter/rendering.dart';

const TITLE = 'Proste-Logger';
const LIMIT_LENGTH = 140;
const SEPARATOR = '-';

/// print mode
enum LogMode {
  info,
  debug,
  warning,
  error,
}

/// Basic information configuration
class BasicConfig {
  const BasicConfig({
    this.title = TITLE,
    this.limitLength = LIMIT_LENGTH,
    this.format = false,
  });

  /// print header title
  final String title;

  /// the length of each print area
  final int limitLength;

  /// format output [List] or [Map]
  final bool format;
}

/// print text color config
class ColorConfig {
  const ColorConfig({
    this.debug = const Color(0xffbbcdc5),
    this.info = const Color(0xff177cb0),
    this.warning = const Color(0xffe29c45),
    this.error = const Color(0xffd9333f),
  });

  /// act on logger.i
  final Color info;

  /// act on logger.d
  final Color debug;

  /// act on logger.w
  final Color warning;

  /// act on logger.e
  final Color error;
}
