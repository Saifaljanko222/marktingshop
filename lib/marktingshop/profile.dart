import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:markting/Component/textfield.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String name = "";
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  Map<String, dynamic> Data = {};
  getdatas() async {
    Stream<DocumentSnapshot<Map<String, dynamic>>> querySnapshot =
        await FirebaseFirestore.instance
            .collection("DATACLIENT")
            .doc("kId4XeMhovgqJrFrxrD3")
            .snapshots();

    setState(() {});
  }

  List<QueryDocumentSnapshot> data = [];
  getdata() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('DATACLIENT').get();
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
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          "Profile page",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(151, 149, 205, 0.776),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('images/saif.jpg')),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(151, 149, 205, 0.776),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.edit, color: Colors.white),
                        onPressed: () {
                          // Add your button's onPressed logic here
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              textfieldwidget(
                  text: 'Name Client',
                  Icont: Icons.numbers,
                  controller: controller2),
              Container(
                width: double.infinity,
                color: Colors.grey,
              ),
              textfieldwidget(
                  text: 'Phone Number',
                  Icont: Icons.numbers,
                  controller: controller2),
              Container(
                width: double.infinity,
                color: Colors.grey,
              ),
              textfieldwidget(
                  text: 'Address',
                  Icont: Icons.description,
                  controller: controller3),
              Container(
                width: double.infinity,
                color: Colors.grey,
              ),
              textfieldwidget(
                  text: 'Email', Icont: Icons.email, controller: controller4),
              Container(
                width: double.infinity,
                color: Colors.grey,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                ///
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(158, 155, 248, 1),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ],
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(151, 149, 205, 0.776),
                      Color.fromRGBO(143, 140, 251, 22)
                    ]),
                    borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    child: Text(
                      'Save Data Client',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
