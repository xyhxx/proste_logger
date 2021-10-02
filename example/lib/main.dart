import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proste_logger/proste_logger.dart';

class Demo {
  Demo(this.title);
  String title;

  @override
  String toString() {
    return 'title is $title';
  }
}

void main() {
  runApp(const Application());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  const SystemUiOverlayStyle style = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  );
  SystemChrome.setSystemUIOverlayStyle(style);
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Proste_Logger'),
        ),
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  MyBody({Key? key}) : super(key: key);

  final logger = ProsteLogger();
  final demoMap = {
    'key': 'key',
    'val': 'msg',
    'cus': {'k': '123', 'd': Demo('555')},
  };
  final demoList = [
    1,
    2,
    3,
    4,
    5,
    '6',
    '7',
    [
      99,
      100,
      {'key': 'k'},
      Demo('1234'),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                logger.i('this is info msg');
              },
              child: const Text('info'),
            ),
            ElevatedButton(
              onPressed: () {
                logger.d('this is debug msg');
              },
              child: const Text('debug'),
            ),
            ElevatedButton(
              onPressed: () {
                logger.w('this is warning msg');
              },
              child: const Text('warn'),
            ),
            ElevatedButton(
              onPressed: () {
                logger.e('this is error msg');
              },
              child: const Text('error'),
            ),
            ElevatedButton(
              onPressed: () {
                logger.d('custom title', title: 'custom');
              },
              child: const Text('custom title'),
            ),
            ElevatedButton(
              onPressed: () {
                logger.i(
                  'this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,this is long text,',
                );
              },
              child: const Text('long text'),
            ),
            ElevatedButton(
              onPressed: () {
                logger.i('汉字内容', title: '汉字title');
              },
              child: const Text('中文汉字'),
            ),
            ElevatedButton(
              onPressed: () {
                logger.i(demoList);
              },
              child: const Text('List'),
            ),
            ElevatedButton(
              onPressed: () {
                logger.i(demoMap);
              },
              child: const Text('Map'),
            ),
            ElevatedButton(
              onPressed: () {
                final map = {"k": 'key', 'v': 'val'};
                final list = ['1', 2, 3, 4, '5'];

                logger
                  ..d(map)
                  ..i(list);
              },
              child: const Text('simple Map and List'),
            ),
            ElevatedButton(
              onPressed: () {
                const longText =
                    'longTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongTextlongText';

                final map = {'k': 'key', 'v': 'val', 'text': longText};
                final list = ['1', 2, 3, '4', longText];

                logger
                  ..d(map, format: true)
                  ..i(list, format: true);
              },
              child: const Text('long text map and list'),
            ),
            ElevatedButton(
              onPressed: () {
                logger.i(demoList, format: true);
              },
              child: const Text('format list'),
            ),
            ElevatedButton(
              onPressed: () {
                logger.i(demoMap, format: true);
              },
              child: const Text('format map'),
            ),
            ElevatedButton(
              onPressed: () {
                final privateLogger = ProsteLogger(
                  basic: const BasicConfig(
                    title: 'config',
                    limitLength: 100,
                  ),
                  colors: const ColorConfig(
                    debug: Colors.white,
                    info: Colors.pink,
                    warning: Colors.green,
                    error: Colors.yellow,
                  ),
                );

                privateLogger.d('this is debug log');
                privateLogger.i('this is info log');
                privateLogger.e('this is error log');
                privateLogger.w('this is warning log');
              },
              child: const Text('custom config'),
            ),
          ],
        ),
      ),
    );
  }
}
