import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterdemo/flutter/pages/page_home.dart';

void main() {
  ///在runapp前调用插件，确保执行binary messenger
  WidgetsFlutterBinding.ensureInitialized();
  runApp(/*IosPage()*/ HomePage());
}

class IosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(home: IosFulePage());
  }
}

class IosFulePage extends StatefulWidget {
  @override
  _IosFulePageState createState() => _IosFulePageState();
}

class _IosFulePageState extends State<IosFulePage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final FixedExtentScrollController scrollController = FixedExtentScrollController(initialItem: _index);
    return CupertinoPageScaffold(
      child: CupertinoButton(
          child: Text("aa"),
          onPressed: () {
            showCupertinoModalPopup(
                context: context,
                builder: (buildContext) {
                  return _buildBottomPicker(CupertinoPicker(
                      scrollController: scrollController,
                      itemExtent: 40,
                      onSelectedItemChanged: (int index) {
                        setState(() => _index = index);
                      },
                      children: [
                        Text("aaa"),
                        Text("aaa"),
                        Text("aaa"),
                        Text("aaa"),
                      ]));
                });
          }),
    );
  }
}

Widget _buildBottomPicker(Widget picker) {
  /// 放在container里面有滚动的弯曲效果，不然全屏竖直滚动
  return Container(
    height: 216,
    padding: const EdgeInsets.only(top: 6.0),
    color: CupertinoColors.white,
    child: picker,
  );
}
