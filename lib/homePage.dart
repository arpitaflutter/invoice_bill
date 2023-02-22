import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  TextEditingController txtname = TextEditingController();
  TextEditingController txtprice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Invoice Bill",style: TextStyle(color: Colors.green.shade900,fontSize: 20,fontWeight: FontWeight.bold)),
          backgroundColor: Colors.lightGreen,
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

                },
                child: Container(
                  height: 50,width: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                    ),
                  child: Center(child: Text("Add",style: TextStyle(color: Colors.lightGreenAccent.shade100,fontWeight: FontWeight.bold,fontSize: 20))),
                ),
              ),
              ListView.builder(itemBuilder: (context, index) {

                },
                itemCount: ,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget ViewTile()
  {
    return 
  }

}
