import 'package:flutter/material.dart';
import 'package:markting/Screens/details_screen.dart';
import 'package:markting/Screens/screen_work.dart';
import 'package:markting/constants.dart';
import 'package:markting/provider/cart_content.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartContent>(context);

    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
            child: Column(children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "images/profile-picture-background-i0irz526vjljpyfv.webp"),
                      fit: BoxFit.cover),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart()));
                  }),
              ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.help_center),
                  onTap: () {}),
              ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {}),
              SizedBox(
                height: 300,
              ),
              Text("Devoloped by Omar Gasem @2024"),
            ]),
          ),
          appBar: AppBar(
            backgroundColor: kAppBarGreen,
            title: Text(
              "Cart",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
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
          body: Column(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  height: 580,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: cart.selectedProduct.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Details(
                                          cart.selectedProduct[index])));
                            },
                            child: ListTile(
                              subtitle: Text(
                                  "\$${cart.selectedProduct[index].price.toString()}    ${cart.selectedProduct[index].suptitle}"),
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage(cart.selectedProduct[index].img),
                              ),
                              title: Text(cart.selectedProduct[index].title),
                              trailing: IconButton(
                                  onPressed: () {
                                    cart.remove(cart.selectedProduct[index]);
                                  },
                                  icon: Icon(Icons.remove)),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: Color.fromARGB(255, 233, 236, 238),
            child: IconTheme(
              data:
                  IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "\$${cart.price.toString()}",
                    style: TextStyle(fontSize: 25),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 204, 212, 220)),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.only(left: 30, right: 30)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                    ),
                    child: Text(
                      "Checkout  (${cart.selectedProduct.length.toString()})",
                      style: TextStyle(fontSize: 19, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
