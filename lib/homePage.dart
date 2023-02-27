import 'package:flutter/material.dart';
import 'package:flutter_exam/modelPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<modelpage> raj = [];
  TextEditingController Name = TextEditingController();
  TextEditingController Number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back, color: Colors.black),
          actions: [
            Icon(
              Icons.more_vert,
              color: Colors.black,
            )
          ],
        ),
        body: ListView.builder(
          itemCount: raj.length,
          itemBuilder: (context, index) {
            return contact(raj[index].contactno!,raj[index].name!);
          },
        ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Container(
        //       height: 200,
        //       width: double.infinity,
        //       color: Colors.grey.shade200,
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.all(30.0),
        //             child: Text(
        //               "My Contact",
        //               style: TextStyle(color: Colors.grey, fontSize: 20),
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.all(32.0),
        //             child: Container(
        //               height: 40,
        //               width: 400,
        //               decoration: BoxDecoration(
        //                 color: Colors.white,
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(20),
        //                 ),
        //               ),
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Text("  Enter your name or number",style: TextStyle(color: Colors.grey.shade400)),
        //                   Icon(Icons.search,color: Colors.grey.shade400),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text("A",style: TextStyle(fontSize: 35,color: Colors.blue),),
        //     ),
        //     Divider(color: Colors.grey),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("asset/images/pic2.jpeg"),
                        ),
                        TextField(
                          controller: Name,
                          decoration:
                              InputDecoration(hintText: "add new name"),
                        ),
                        TextField(
                          controller: Number,
                          decoration: InputDecoration(hintText: "add new number"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            modelpage m1 = modelpage(name: Name.text,contactno: Number.text);
                              setState(() {
                                raj.add(m1);
                                Navigator.pop(context);
                              },);
                              },
                          child: Text("add"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Icon(Icons.add),),
      ),
    );
  }

  Widget contact(String name,String no) {
    return Container(
      height: 80,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          Image.asset("asset/images/pic1.jpg", height: 70, width: 70),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "$no",
              ),
            ],
          ),
          Expanded(child: SizedBox()),
          Icon(Icons.call),
          SizedBox(width: 15),
          Icon(Icons.sms),
        ],
      ),
    );
  }
}
