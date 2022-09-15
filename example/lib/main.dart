import 'package:flutter/material.dart';
import 'package:flutter_app_group/flutter_app_group.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var appGroup = "";
  @override
  void initState() {
    super.initState();

    initAppGroup();
  }

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('数据共享'),
        ),
        body: Center(
          child: Text('读取数据为: $appGroup\n'),
        ),
      ),
    );
  }
}
