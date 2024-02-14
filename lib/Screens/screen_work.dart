import 'package:flutter/material.dart';
import 'package:markting/Screens/Home.dart';
import 'package:markting/Screens/cart.dart';
import 'package:markting/marktingshop/profile.dart';
import 'package:markting/provider/cart_content.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ScreenWork extends StatefulWidget {
  @override
  State<ScreenWork> createState() => _ScreenWorkState();
}

class _ScreenWorkState extends State<ScreenWork> {
  final PageController _pageController = PageController();
  bool _isPressed = false;

  void _togglePressed() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  showMenu() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: Color(0xff232f34),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 36,
                ),
                SizedBox(
                    height: (56 * 6).toDouble(),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: Color(0xff344955),
                        ),
                        child: Stack(
                          alignment: Alignment(0, 0),
                          children: <Widget>[
                            Positioned(
                              top: -36,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        color: Color(0xff232f34), width: 10)),
                                child: Center(
                                  child: ClipOval(
                                    child: Image.network(
                                      "https://i.stack.imgur.com/S11YG.jpg?s=64&g=1",
                                      fit: BoxFit.cover,
                                      height: 36,
                                      width: 36,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      "Inbox",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.inbox,
                                      color: Colors.white,
                                    ),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Starred",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                    ),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Sent",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Trash",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.delete_outline,
                                      color: Colors.white,
                                    ),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Spam",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.error,
                                      color: Colors.white,
                                    ),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Drafts",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.mail_outline,
                                      color: Colors.white,
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))),
                Container(
                  height: 56,
                  color: Color(0xff4a6572),
                )
              ],
            ),
          );
        });
  }

  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {},
        controller: _pageController,
        children: <Widget>[
          Home(),
          Cart(),
          profile(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) {
            // ignore: unused_element
            print("asdfsadfasdf    $index");
            _pageController.jumpToPage(index);
            setState() {
              currentpage = index;
            }
          },
          // indicatorColor: kPressedColorBotton,
          selectedIndex: currentpage,
          // backgroundColor: kBottomContainerColor,
          destinations: <Widget>[
            NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(
                  Icons.home_outlined,
                  size: 40,
                  color: _isPressed ? Colors.white : Colors.black,
                ),
                label: "Home"),
            Consumer<CartContent>(builder: ((context, cart, child) {
              return NavigationDestination(
                icon: Badge(
                  label: Text(cart.selectedProduct.length.toString()),
                  largeSize: 20,
                  child: Icon(
                    size: 40,
                    Icons.add_shopping_cart,
                    color: _isPressed ? Colors.white : Colors.black,
                  ),
                ),
                label: "Cart",
              );
            })),
            NavigationDestination(
              icon: Icon(
                Icons.account_box,
                size: 40,
                color: _isPressed ? Colors.white : Colors.black,
              ),
              label: "Account",
            ),
          ]),
    );
  }
}
