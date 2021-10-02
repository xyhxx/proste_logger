<img src="https://raw.githubusercontent.com/xyhxx/program_preview/master/logo/logger.png" />

# proste_logger

A simple, easy, used plug-in that prints out long text and formats Map or List data structures. You can also customize the title information of the print area, the color of the text, etc. . The print content also shows the trigger area and the trigger method.

# Usage

This is a simple way to use logger, you need to initialize a ProsteLogger, and then call its internal methods to print out the relevant content.

Of course we can do some configuration information during initialization, which I’ll cover in more detail later.

``` dart
  final logger = ProsteLogger();

  logger.i('this is info msg');
```

# Exhibition

## Simple text
<img src="https://raw.githubusercontent.com/xyhxx/program_preview/master/logger/simple.png" />

## Simple Map and List

It is important to note that if the data structure contains a class data structure, the printed data will not have double quotation marks. `jsonEncode()`, which is used first for formatting, is called `toString()`if it fails.

<img src="https://raw.githubusercontent.com/xyhxx/program_preview/master/logger/map-and-list.png" />

## Format Map and List
<img src="https://raw.githubusercontent.com/xyhxx/program_preview/master/logger/format.png" />

## Long text content
<img src="https://raw.githubusercontent.com/xyhxx/program_preview/master/logger/long-text.png" />

## Long text is contained in Map and List
<img src="https://raw.githubusercontent.com/xyhxx/program_preview/master/logger/long-map-list.png" />

# Call

``` dart
  final logger = ProsteLogger();

  logger.d('this is debug msg'); // Print only in debug, depending on the constant kDebugMode built into flutter
  logger.i('this is info msg', {title: 'self title', format: false}); // Print methods can also define their own title information or whether to format data
  logger.w('this is warning msg');
  logger.e('this is error msg');

```

# Initialization

``` dart
final logger = ProsteLogger(
  basic: const BasicConfig(
    title: 'config', // printed title
    limitLength: 100, // length of one line
    format: false, // Whether to print after formatting when the data is Map or List
  ),
  colors: const ColorConfig(
    debug: Colors.white, // logger.d() text color
    info: Colors.pink, // logger.i() text color
    warning: Colors.green, // logger.w() text color
    error: Colors.yellow, // logger.e() text color
  ),
);
```

__If you have any suggestions or questions in use, welcome to <a href="https://github.com/xyhxx/proste_logger/issues">issues</a>I will handle it as soon as I see it. Thank you!__
