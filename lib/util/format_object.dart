String getDeepSpace(int deep) {
  final tab = StringBuffer();
  for (int i = 0; i < deep; i++) {
    tab.write('  ');
  }
  return tab.toString();
}

String convertObject(dynamic object, int deep, {bool isObject = false}) {
  final buffer = StringBuffer();
  final nextDeep = deep + 1;
  if (object is Map) {
    final list = object.keys.toList();
    if (!isObject) {
      buffer.write(getDeepSpace(deep));
    }
    buffer.write('{');
    if (list.isEmpty) {
      buffer.write('}');
    } else {
      buffer.write('\n');
      for (int i = 0; i < list.length; i++) {
        buffer
          ..write('${getDeepSpace(nextDeep)}"${list[i]}":')
          ..write(convertObject(object[list[i]], nextDeep, isObject: true));
        if (i < list.length - 1) {
          buffer
            ..write(',')
            ..write('\n');
        }
      }
      buffer
        ..write('\n')
        ..write('${getDeepSpace(deep)}}');
    }
  } else if (object is List) {
    if (!isObject) {
      buffer.write(getDeepSpace(deep));
    }
    buffer.write('[');
    if (object.isEmpty) {
      buffer.write(']');
    } else {
      buffer.write('\n');
      for (int i = 0; i < object.length; i++) {
        buffer
          ..write(getDeepSpace(nextDeep))
          ..write(convertObject(object[i], nextDeep, isObject: true));
        // buffer.write(convertObject(object[i], nextDeep));
        if (i < object.length - 1) {
          buffer
            ..write(',')
            ..write('\n');
        }
      }
      buffer
        ..write('\n')
        ..write('${getDeepSpace(deep)}]');
    }
  } else if (object is String) {
    buffer.write('"$object"');
  } else if (object is num || object is bool) {
    buffer.write(object);
  } else {
    buffer.write('"${object.toString()}"');
  }
  return buffer.toString();
}
