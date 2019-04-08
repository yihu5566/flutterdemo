import 'package:flutter/material.dart';

class StackPage extends StatefulWidget {
  @override
  StackPageState createState() {
    return new StackPageState();
  }
}

class StackPageState extends State<StackPage> {
  List<StackFit> stackFits = [StackFit.loose, StackFit.expand, StackFit.passthrough];
  List<Overflow> overFlows = [Overflow.clip, Overflow.visible];
  int fitValue = 0;
  int overFlowValue = 0;
  @override
  Widget build(BuildContext context) {
//    层叠布局，子widget可以根据到父容器四个角的位置来确定本身的位置。绝对定位允许子widget堆叠（按照代码中声明的顺序）。
//    Flutter中使用Stack和Positioned来实现绝对定位，Stack允许子widget堆叠，而Positioned可以给子widget定位（根据Stack的四个角）
    return Scaffold(
      appBar: AppBar(
        title: Text("stack"),
      ),
      body: Row(
        children: <Widget>[
          SizedBox(
            width: 400,
            height: 400,
            child: Stack(
              //fit：此参数用于决定没有定位的子widget如何去适应Stack的大小。StackFit.loose表示使用子widget的大小，StackFit.expand表示扩伸到Stack的大小
              fit: stackFits[fitValue],
              overflow: overFlows[overFlowValue],
              children: <Widget>[
                Column(
                  children: <Widget>[
                    DropdownButton(
                      hint: Text(stackFits[fitValue].toString()),
                      onChanged: (value) {
                        setState(() {
                          fitValue = value;
                        });
                      },
                      items: <DropdownMenuItem>[
                        DropdownMenuItem(
                          child: Text(stackFits[0].toString()),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Text(stackFits[1].toString()),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text(stackFits[2].toString()),
                          value: 2,
                        ),
                      ],
                    ),
                    DropdownButton(
                        hint: Text(overFlows[overFlowValue].toString()),
                        items: <DropdownMenuItem>[
                          DropdownMenuItem(
                            child: Text(overFlows[0].toString()),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Text(overFlows[1].toString()),
                            value: 1,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            overFlowValue = value;
                          });
                        })
                  ],
                ),
                Positioned(
                  child: Text("bottom"),
                  bottom: 0.0,
                  left: 80,
                ),
                Container(
                  color: Colors.blue.shade200,
                  child: Text("哈哈哈"),
                ),
                // 充满
                Positioned.fill(
                    child: Text(
                  "fill",
                  textAlign: TextAlign.center,
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}