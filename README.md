# simple_timeline

**`simple_timeline` is a Timeline builder For [Flutter](https://flutter.dev/) Application.**

* [中文版](https://github.com/vincnttt/SimpleTimeline/blob/main/README_zh.md)

## Demo

![display](https://github.com/vincnttt/SimpleTimeline/blob/main/screenshots/display.gif)

### Styling

| Light | Dark |
| :---: | :---: |
| ![light-mode](https://github.com/vincnttt/SimpleTimeline/blob/main/screenshots/light.png) |  ![dark-mode](https://github.com/vincnttt/SimpleTimeline/blob/main/screenshots/dark.png) |

## Usage

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
## Example

Check it on [`example/`](https://github.com/vincnttt/SimpleTimeline/tree/main/example) folder :file_folder:

## License
[LICENSE](https://github.com/vincnttt/SimpleTimeline/blob/main/LICENSE)

### More Details

If you found that this project really helpful for you, click the star above :star:  
This project was tested on Nexus 4 API 29 (Android 10.0)
