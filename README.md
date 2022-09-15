# flutter_app_group

这是一个iOS使用的AppGroup插件用于应用间数据共享

## example
* 需要先在Xcode中添加app groups 
* 设备需要ios8以上
* TARGETS-->AppExtensionDemo-->Capabilities-->App Groups，找到以后，将App Groups右上角的开关打开，然后选择或者新增一个groups
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