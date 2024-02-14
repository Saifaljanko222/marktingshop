import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:markting/register.dart';

class activepage extends StatefulWidget {
  const activepage({super.key});

  @override
  State<activepage> createState() => _activepageState();
}

class _activepageState extends State<activepage> {
  final TextEditingController controller = TextEditingController();

  List<QueryDocumentSnapshot> data = [];

  getdata() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('keysuser').get();
    data.addAll(querySnapshot.docs);

    setState(() {});
  }

  bool containsFruit = false;

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(65, 58, 251, 0.779),
            Color.fromRGBO(143, 140, 251, 22),
          ])),
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 22),
            child: Text(
              "Hello..\nActive app ",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            height: double.infinity,
            width: double.infinity,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(143, 140, 251, 1),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ]),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            final value = await FlutterClipboard.paste();
                            setState(() {
                              controller.text = value.toString();
                            });
                          },
                          child: Icon(Icons.paste),
                        ),
                        hintText: 'Enter your keys active',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.grey,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(143, 140, 251, 1),
                      Color.fromRGBO(143, 140, 251, 22)
                    ]),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(158, 155, 248, 1),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ],
                  ),
                  child: Center(
                    child: MaterialButton(
                        onPressed: () {
                          String textFieldValue = controller.text;

                          // FirebaseFirestore.instance
                          //     .collection('keysuser')
                          //     .get()
                          //     .then((QuerySnapshot querySnapshot) {
                          //   querySnapshot.docs.forEach((doc) {
                          //     print(textFieldValue);
                          //     print(doc["keys"]);
                          //   });
                          // });
                          //==============================
                          FirebaseFirestore.instance
                              .collection('keysuser')
                              .where("keys", isEqualTo: textFieldValue)
                              .get()
                              .then((QuerySnapshot querySnapshot) {
                            if (querySnapshot.docs.isNotEmpty) {
                              print("serching true");
                              // Documents matching the search query found
                              // for (DocumentSnapshot doc in querySnapshot.docs) {
                              //   print(doc.data()); // Access the document data
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => register()));
                              // }
                            } else {
                              // No documents matching the search query found
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text('key active not true:'),
                                    actions: [
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                              print('No matching documents found.');
                            }
                          });
                        },
                        minWidth: double.infinity,
                        height: 60,
                        child: Text(
                          'ACTIVE APP',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
              )
            ]),
          ),
        )
      ]),
    );
  }
}
