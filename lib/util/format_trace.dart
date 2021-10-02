/// return stack info
List<String> formatTrack(StackTrace stack) {
  final tracks = stack.toString().split('\n');

  final result = [
    tracks[3].replaceFirst('#3', '#0'),
    tracks[4].replaceFirst('#4', '#1'),
  ];

  return result;
}
