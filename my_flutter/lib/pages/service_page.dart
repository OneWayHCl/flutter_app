import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boost/flutter_boost.dart';

class ServicePage extends StatefulWidget {
  final String data;

  const ServicePage({Key key, this.data}) : super(key: key);

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {

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
            SingleChildScrollView( scrollDirection: Axis.horizontal,child: Container(
              height: 40,
              color: Colors.yellow,
              padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              child: Row(

              children: [
                // Flexible(child: child)
                Container(
                  color: Colors.orange,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                  children: [
                    Container(child: Text('OPPO', style: TextStyle(fontSize: 14)),height: 38,),
                    Container(height: 2, width: 4, margin: EdgeInsets.only(left: 10, right: 10), color: Colors.black,)
                  ],
                ),
                  )
                ),
                Container(
                  width: 280,
                  child: Column(
                  children: [
                    Container(child: TextButton(
                  child: Text('OnePlus', style: TextStyle(fontSize: 14)),
                  onPressed: () {},
                ),height: 38,),
                  Container(height: 2, width: double.infinity, margin: EdgeInsets.only(left: 10, right: 10), color: Colors.black,)
                  ],
                ),
                ),Container(
                  width: 190,
                  child: Column(
                  children: [
                    Container(child: TextButton(
                  child: Text('第三方商品', style: TextStyle(fontSize: 14)),
                  onPressed: () {},
                ),height: 38,),
                  Container(height: 2, width: double.infinity, margin: EdgeInsets.only(left: 10, right: 10), color: Colors.black,)
                  ],
                ),
                ),
              ],
            ),),),
            
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
                onPressed: () {
                },
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
