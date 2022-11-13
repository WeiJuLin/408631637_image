import 'package:flutter/material.dart';

void main() {
  runApp(StarCounter());
}


class StarCounter extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '期中作業'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _itemImage = [
    Image.network("https://doqvf81n9htmm.cloudfront.net/data/crop_article/117726/shutterstock_718390942.jpg_1140x855.jpg",fit:BoxFit.fill),
    Image.network("https://cdn2.ettoday.net/images/6138/6138560.jpg",fit:BoxFit.scaleDown),
    Image.network("https://image1.thenewslens.com/2016/7/s97thndowc0eajuotlml2mgghrzqp5.jpg?auto=compress&h=648&q=80&w=1080%201080w",fit:BoxFit.scaleDown),
    Image.network("https://cdn2.ettoday.net/images/6138/6138566.jpg",fit:BoxFit.scaleDown)];
//1
  int index =0;


  tmpFunction() {
    Container(
      child: _itemImage[index],
      width: 350,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  final snackBar = SnackBar(
                    content: const Text('海獺'),);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }, child:  Container(
                  child: _itemImage[index],
                  width: 350,
                ),
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  if ((index-1) < 0) index = _itemImage.length-1;
                  else index -=1;
                  setState(() { index;});
                }, child: Text("<")),
                ElevatedButton(onPressed: (){
                  if ((index+1) >= _itemImage.length)index = 0;
                  else index +=1;
                  setState(() { index;});
                }, child: Text(">")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
