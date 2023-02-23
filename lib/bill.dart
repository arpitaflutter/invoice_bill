import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:invoice_bill/dataModel.dart';
import 'dart:ui' as ui;

class bill extends StatefulWidget {
  const bill({Key? key}) : super(key: key);

  @override
  State<bill> createState() => _billState();
}

class _billState extends State<bill> {
  final GlobalKey globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {

    List<dataModel> l1 = ModalRoute.of(context)!.settings.arguments as List<dataModel>;
// print(l1);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              captureImage();
            }, icon: Icon(Icons.save))
          ],
        ),
        body: RepaintBoundary(
          key: globalKey,
          child: Column(
              children: [
                Text("SHOP RECEIPT",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Text("SUPERMARKET 123",style: TextStyle(fontSize: 13),),
                Text("PLANET EARTH",style: TextStyle(fontSize: 13),),
                Text("Tel :123-456-7890",style: TextStyle(fontSize: 13),),
                SizedBox(height: 20,),
                Text("RECEIPT :12345",style: TextStyle(fontSize: 13),),
                Text("DATE :12/12/2023",style: TextStyle(fontSize: 13),),
                Text("CASHIER :JOHN DOE",style: TextStyle(fontSize: 13),),
                SizedBox(height: 15,),
                Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                      return viewTile(l1[index]);
                    },
                    itemCount: l1.length,
                  ),
                ),
                Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("TAXABLE",style: TextStyle(fontSize: 15),),
                      Spacer(),
                      Text("232323",style: TextStyle(fontSize: 15),),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("VAT15%",style: TextStyle(fontSize: 15),),
                      Spacer(),
                      Text("65656",style: TextStyle(fontSize: 15),),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("TOTAL",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Text("8877",style: TextStyle(fontSize: 15),),
                    ],
                  ),
                ),
                Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("CASH",style: TextStyle(fontSize: 15,),),
                      Spacer(),
                      Text("8877",style: TextStyle(fontSize: 15),),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("CHANGE",style: TextStyle(fontSize: 15,),),
                      Spacer(),
                      Text("898",style: TextStyle(fontSize: 15),),
                    ],
                  ),
                ),
                Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("paid with CASH",style: TextStyle(fontSize: 15),),
                    ],
                  ),
                ),
                Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
                Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
                SizedBox(height: 10,),
                Text("THANK YOU",style: TextStyle(fontSize: 13,letterSpacing: 5),),
                SizedBox(height: 5,),
                Text("HAVE A NICE DAY",style: TextStyle(fontSize: 13,letterSpacing: 1),),
              ]
          ),
        ),
      ),
    );
  }

  Widget viewTile(dataModel l1)
  {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: [
          Text("${l1.name}",style: TextStyle(fontSize: 15,),),
          Spacer(),
          Text("${l1.price}",style: TextStyle(fontSize: 15),)
        ],
      ),
    );
  }

  void captureImage() async{

    RenderRepaintBoundary? boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;

    final ui.Image? image = await boundary?.toImage();

    final ByteData? byteData = await image!.toByteData(format: ui.ImageByteFormat.png);
    var pngBytes = byteData!.buffer.asUint8List();

    final result = await ImageGallerySaver.saveImage(pngBytes,name: "My Post.png",quality: 50);
    print(result);

  }

}