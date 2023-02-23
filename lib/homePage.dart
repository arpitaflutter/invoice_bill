import 'package:flutter/material.dart';
import 'package:invoice_bill/dataModel.dart';

import 'dataModel.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  TextEditingController txtname = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  List<dataModel> l1 = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Invoice Bill",style: TextStyle(color: Colors.green.shade900,fontSize: 20,fontWeight: FontWeight.bold)),
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: txtname,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  hintText: "Product",
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightGreen,width: 3)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightGreen,width: 3)),
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: txtprice,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  hintText: "Price",
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightGreen,width: 3)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightGreen,width: 3)),
                ),
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: () {
                  dataModel d1 = dataModel(price: txtprice.text,name: txtname.text);
                  setState(() {
                    l1.add(d1);
                  });

                },
                child: Container(
                  height: 50,width: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(child: Text("Add",style: TextStyle(color: Colors.lightGreenAccent.shade100,fontWeight: FontWeight.bold,fontSize: 20))),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Container(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return ViewTile(l1[index],index);
                  },
                    itemCount: l1.length,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'bill',arguments: l1);
                },
                child: Container(
                  height: 50,width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text("Generate",style: TextStyle(color: Colors.white,fontSize: 20))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ViewTile(dataModel l2,int a1)
  {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 80,width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.green),
          boxShadow: [
            BoxShadow(color: Colors.grey,blurRadius: 2,spreadRadius: 3),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product: ${l2.name}",style: TextStyle(fontSize:20,color: Colors.green.shade800)),
                  // SizedBox(height: 3,),
                  Text("Price: ${l2.price}",style: TextStyle(fontSize:20,color: Colors.green.shade800)),
                ],
              ),
              Spacer(),
              InkWell(
                  onTap: () {
                    setState(() {
                      l1.removeAt(a1);
                    });
                  },
                  child: Icon(Icons.delete,color: Colors.red,size: 25,)
              )
            ],
          ),
        ),
      ),
    );
  }

}