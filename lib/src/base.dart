// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:proste_logger/util/format_object.dart';
import 'package:proste_logger/util/format_trace.dart';
import './config.dart';

class _Line {
  const _Line(this.start, this.end);

  final String start;
  final String end;
}

/// they are the default configuration constants
class ProsteLogger {
  /// initialize partial configuration
  ProsteLogger({
    this.basic = const BasicConfig(),
    this.colors = const ColorConfig(),
  }) {
    ansiColorDisabled = false;
    _pen = AnsiPen();
    _limitLength = basic.limitLength;

    _formatLine();
  }

  /// the length of each print area
  late final int _limitLength;

  /// log text colors
  late final ColorConfig colors;

  /// log text color
  late final AnsiPen _pen;

  /// log basic config
  late final BasicConfig basic;

  /// write header and footer
  _Line _formatLine([String? title]) {
    final label = title ?? basic.title;
    final split = List.filled((basic.limitLength / 2 - label.length).floor(), '-').join();
    final startLine = '$split${label}$split';

    final endLineStr = StringBuffer();
    final cnCharReg = RegExp('[\u4e00-\u9fa5]');

    for (int i = 0; i < startLine.length; i++) {
      if (cnCharReg.stringMatch(startLine[i]) != null) {
        endLineStr.write('-');
      }
      endLineStr.write('-');
    }
    final endLine = endLineStr.toString();

    return _Line(startLine, endLine);
  }

  /// Split content and stack
  String _customSeparate(String startLine) {
    final endLineStr = StringBuffer();
    final cnCharReg = RegExp('[\u4e00-\u9fa5]');

    for (int i = 0; i < startLine.length; i++) {
      if (cnCharReg.stringMatch(startLine[i]) != null) {
        endLineStr.write('*');
      }
      endLineStr.write('*');
    }

    return endLineStr.toString();
  }

  /// print only in debug mode
  void d(dynamic msg, {String? title, bool format = false}) {
    if (kDebugMode) {
      _log(msg, LogMode.debug, title, format);
    }
  }

  /// print info msg
  void i(dynamic msg, {String? title, bool? format}) => _log(msg, LogMode.info, title, format);

  /// print error msg
  void e(dynamic msg, {String? title, bool? format}) => _log(msg, LogMode.error, title, format);

  /// print warning msg
  void w(dynamic msg, {String? title, bool? format}) => _log(msg, LogMode.warning, title, format);

  /// jungle neet to call [_segmentationLog]
  void _log(dynamic message, LogMode mode, String? title, bool? format) {
    _getColorPen(mode);
    final line = _formatLine(title);

    late final dynamic msg;
    if (message is Map || message is List) {
      if (format ?? basic.format) {
        msg = convertObject(message, 0).split('\n');
      } else {
        try {
          msg = jsonEncode(message);
        } catch (_) {
          msg = message.toString();
        }
      }
    } else {
      msg = message.toString();
    }

    try {
      _outPut(msg, mode, line);
    } catch (e, st) {
      print(e);
      print(st);
    }
  }

  /// get ansicolor
  void _getColorPen(LogMode mode) {
    late final Color color;
    switch (mode) {
      case LogMode.info:
        color = colors.info;
        break;
      case LogMode.debug:
        color = colors.debug;
        break;
      case LogMode.warning:
        color = colors.warning;
        break;
      case LogMode.error:
        color = colors.error;
        break;
    }

    _pen.rgb(r: color.red / 255, g: color.green / 255, b: color.blue / 255);
  }

  /// output
  void _outprint(String msg) => msg.length < _limitLength ? printPen(msg) : _segmentationLog(msg);
  void _outPut(dynamic msg, LogMode mode, _Line line) {
    final stack = StackTrace.current;
    final traces = formatTrack(stack);

    printPen(line.start);
    _logEmpyLine();

    if (msg is List) {
      msg.forEach((el) => _outprint(el.toString()));
    } else {
      _outprint(msg.toString());
    }

    _logEmpyLine();
    printPen(_customSeparate(line.start));

    _logEmpyLine();
    traces.forEach(printPen);
    _logEmpyLine();

    printPen(line.end);
  }

  /// print msg with pen
  void printPen(String msg) => print(_pen(msg));

  /// line break printing
  void _segmentationLog(String msg) {
    final outStr = StringBuffer();
    for (var index = 0; index < msg.length; index++) {
      outStr.write(msg[index]);
      if (index % _limitLength == 0 && index != 0) {
        printPen(outStr.toString());
        outStr.clear();
        final lastIndex = index + 1;
        if (msg.length - lastIndex < _limitLength) {
          final remainderStr = msg.substring(lastIndex, msg.length);
          printPen(remainderStr);
          break;
        }
      }
    }
  }

  /// print a blank line of text
  void _logEmpyLine() => print('');
}
