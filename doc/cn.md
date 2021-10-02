<img src="https://raw.githubusercontent.com/xyhxx/program_preview/master/logo/logger.png" />

# proste_logger

一个简单，方便，已用，可以打印出长文本以及格式化Map或者List数据结构的插件。你也可以自定义打印区域的标题信息，文字颜色等。打印内容种还会展示触发的区域和触发方式。

# 使用
这是一个简单的方式使用logger，你需要初始化一个ProsteLogger，之后调用其内部的方法即可打印出相关的内容。

当然我们可以在初始化的时候做一些配置信息，这个我会在稍后详细介绍。

``` dart
  final logger = ProsteLogger();

  logger.i('this is info msg');

```

# 展示

## 普通文本
<img src="https://raw.githubusercontent.com/xyhxx/program_preview/master/logger/simple.png" />

## 简单的Map和List数据结构

这里需要注意一点，如果数据结构内含有class类数据结构，打印出数据不会有双引号。在进行格式转换时优先是使用的`jsonEncode`,如果失败了会调用`toString()`进行格式转换。

<img src="https://raw.githubusercontent.com/xyhxx/program_preview/master/logger/map-and-list.png" />

## 格式化后的Map和List数据结构
<img src="https://raw.githubusercontent.com/xyhxx/program_preview/master/logger/format.png" />

## 长文本内容
<img src="https://raw.githubusercontent.com/xyhxx/program_preview/master/logger/long-text.png" />

## Map和List中包含长文本
<img src="https://raw.githubusercontent.com/xyhxx/program_preview/master/logger/long-map-list.png" />

# 方法

``` dart
  final logger = ProsteLogger();

  logger.d('this is debug msg'); // 只有在debug环境下打印，判断依据为flutter内置的常量kDebugMode
  logger.i('this is info msg', {title: 'self title', format: false}); // 打印方法也可以定义自己的头信息或者是否格式化数据
  logger.w('this is warning msg');
  logger.e('this is error msg');

```

# 初始化

``` dart
final logger = ProsteLogger(
  /// 基础配置
  basic: const BasicConfig(
    title: 'config', // 打印的头部区域
    limitLength: 100, // 每行显示的长度
    format: false, // 数据为Map或者List时是否格式化后打印
  ),
  colors: const ColorConfig(
    debug: Colors.white, // logger.d()的文字颜色
    info: Colors.pink, // logger.i()的文字颜色
    warning: Colors.green, // logger.w()的文字颜色
    error: Colors.yellow, // logger.e()的文字颜色
  ),
);
```

__如果你有任何建议或者使用中的问题，欢迎到<a href="https://github.com/xyhxx/proste_logger/issues">issues</a>中提出，我会在看到后尽快处理，谢谢！__
