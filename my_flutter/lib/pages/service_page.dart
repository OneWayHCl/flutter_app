import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:my_flutter/pages/service_data.dart';

class ServicePage extends StatefulWidget {
  final String data;

  const ServicePage({Key key, this.data}) : super(key: key);

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  var dataList = brands;

  void onTapActionWithIndex(int index) {
    print('onTapActionWithIndex--${index}');
    setState(() {
      for (var element in dataList) {
        element.selected = false;
      }
      dataList[index].selected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Title(color: Colors.black, child: Text('服务')),
      ),
      body: Center(
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Container(
              height: 40,
              child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 20),
                  children: List.generate(
                      dataList.length,
                      (index) => ServiceTabItemCell(
                            title: dataList[index].title,
                            selected: dataList[index].selected,
                            onTapAction: (){
                              onTapActionWithIndex(index);
                            },
                          ))),
            ),
            const Align(
                alignment: Alignment.center,
                child: Text("Simple flutter page",
                    style: TextStyle(fontSize: 26))),
            const SizedBox(height: 50),
            Align(
                alignment: Alignment.center,
                child: Text("data:${widget.data}",
                    style: const TextStyle(fontSize: 26))),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton.filled(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                onPressed: () {},
                child: const Text('pop and return data',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ServiceTabItemCell extends StatefulWidget {
  final String title;
  final bool selected;
  final Function onTapAction;

  const ServiceTabItemCell({Key key, this.title, this.selected, this.onTapAction})
      : super(key: key);

  @override
  _ServiceTabItemCellState createState() => _ServiceTabItemCellState();
}

class _ServiceTabItemCellState extends State<ServiceTabItemCell> {
  double textWidth(
      {String text,
      TextStyle style,
      int maxLines = 2 ^ 31,
      double maxWidth = double.infinity}) {
    text = widget.title;
    if (text == null || text.isEmpty) {
      return 0.0;
    }
    if (style == null) {
      style = TextStyle(fontSize: 14);
    }
    final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text: text, style: style),
        maxLines: maxLines)
      ..layout(maxWidth: maxWidth);
    return textPainter.size.width;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: 40,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: 38,
                  width: textWidth(),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(widget.title),
                  ),
                ),
                Container(
                  height: 2,
                  padding: EdgeInsets.only(left: 2, right: 2),
                  width: textWidth() - 4,
                  color:
                      widget.selected == true ? Colors.black : Colors.transparent,
                )
              ],
            ),
          )),
      onTap: widget.onTapAction,
    );
  }
}
