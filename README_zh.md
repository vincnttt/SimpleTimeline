# simple_timeline

**`simple_timeline` 是 [Flutter](https://flutter.dev/) 应用程序的时间轴生成器。**

* [English version](https://github.com/vincnttt/SimpleTimeline/blob/main/README.md)

## 演示

![display](https://github.com/vincnttt/SimpleTimeline/blob/main/screenshots/display.gif)

### 模式

| 浅色 | 深色 |
| :---: | :---: |
| ![light-mode](https://github.com/vincnttt/SimpleTimeline/blob/main/screenshots/light.png) |  ![dark-mode](https://github.com/vincnttt/SimpleTimeline/blob/main/screenshots/dark.png) |

## 用法

```dart
import 'package:flutter/material.dart';
import 'package:simple_timeline/simple_timeline.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Timeline"),
      ),
      body: SimpleTimeline(
        children: <Widget>[
          _timelineContent(context, "Hi There", Icons.near_me),
          _timelineContent(context, "Morning", Icons.wb_sunny),
          _timelineContent(context, "Nite", Icons.brightness_3),
        ],
      ),
    );
  }

  Widget _timelineContent(context, String title, IconData icon) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        title: Text(title),
        leading: Icon(icon),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
```

## 示例

在 [`example/`](https://github.com/vincnttt/SimpleTimeline/tree/main/example) 文件夹上查看 :file_folder:

## 许可证
[LICENSE](https://github.com/vincnttt/SimpleTimeline/blob/main/LICENSE)

### 详细
此项目已经在 Nexus 4 API 29 (Android 10.0) 上过测试。
