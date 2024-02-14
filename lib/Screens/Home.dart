import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:markting/Models/item.dart';
import 'package:markting/Screens/cart.dart';
import 'package:markting/Screens/details_screen.dart';
import 'package:markting/Screens/screen_work.dart';
import 'package:markting/homepage.dart';
import 'package:markting/provider/cart_content.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _logoutUser(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, homepage.screenRout, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/test.jpg"), fit: BoxFit.cover),
              ),
              accountName: Text("Omar Gasem",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              accountEmail: Text(
                "businessmanomar99@gmail.com",
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: CircleAvatar(
                  radius: 55, backgroundImage: AssetImage("images/test.jpg")),
            ),
            ListTile(
                selected: true,
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScreenWork()));
                }),
            ListTile(
                title: Text("My products"),
                leading: Icon(Icons.add_shopping_cart),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                }),
            ListTile(
                title: Text("About"),
                leading: Icon(Icons.help_center),
                onTap: () {}),
            ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.exit_to_app),
                onTap: () {
                  _logoutUser(context);
                }),
            SizedBox(
              height: 300,
            ),
            Text("Devoloped by Omar Gasem @2024"),
          ]),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(151, 149, 205, 0.776),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                size: 55,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 3.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: product.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: kActiveColorCard,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(product[index])));
                    },
                    child: GridTile(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            bottom: 70,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(product[index].img,
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                      footer: GridTileBar(
                        backgroundColor: Colors.white,
                        trailing: Consumer<CartContent>(
                            builder: ((context, cart, child) {
                          return IconButton(
                              color: Color.fromARGB(255, 55, 60, 56),
                              onPressed: () {
                                cart.add(product[index]);
                              },
                              icon: Icon(Icons.add));
                        })),
                        leading: Text(
                          "\$" + product[index].price.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                          product[index].title,
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          product[index].suptitle,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
