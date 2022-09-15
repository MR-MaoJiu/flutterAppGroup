# flutter_app_group

这是一个iOS使用的AppGroup插件用于设备间数据共享

## example
* 必须先设置APPGroup
```dart
initAppGroup() async {
  try {
    ///必须先设置APPGroup
    FlutterAppGroup.setAppGroup("group.we.record");
    FlutterAppGroup.setString("hello", "Hi!AppGroup");
    appGroup = await FlutterAppGroup.get("hello");
    setState(() {});
  } catch (e) {
    print(e);
  }
}
```