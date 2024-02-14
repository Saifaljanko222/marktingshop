import 'package:flutter/material.dart';
import 'package:markting/Models/item.dart';
import 'package:markting/constants.dart';
import 'package:markting/provider/cart_content.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  Product items;
  Details(this.items);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartContent>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Details screen",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: kAppBarGreen,
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
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Image(image: AssetImage(widget.items.img)),
            SizedBox(height: 11),
            Row(children: <Widget>[
              Text(
                widget.items.title,
                style: TextStyle(fontSize: 23),
                maxLines: 3,
              ),
            ]),
            Row(children: <Widget>[
              Text(
                widget.items.suptitle,
                style: TextStyle(fontSize: 18),
              ),
            ]),
            SizedBox(height: 30),
            Row(children: <Widget>[
              Text(
                "\$" + widget.items.price.toString(),
                style: TextStyle(fontSize: 25),
              ),
            ]),
            Row(children: <Widget>[
              Text(
                "Min. oreder: 1 piece",
                style: TextStyle(fontSize: 15),
              ),
            ]),
            SizedBox(height: 16),
            Row(children: <Widget>[
              Container(
                child: Text(
                  "New",
                  style: TextStyle(fontSize: 15),
                ),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 129, 129),
                    borderRadius: BorderRadius.circular(5)),
              ),
              Icon(
                Icons.star,
                color: Color.fromARGB(255, 255, 191, 0),
                size: 30,
              ),
              Icon(
                Icons.star,
                color: Color.fromARGB(255, 255, 191, 0),
                size: 30,
              ),
              Icon(
                Icons.star,
                color: Color.fromARGB(255, 255, 191, 0),
                size: 30,
              ),
              Icon(
                Icons.star,
                color: Color.fromARGB(255, 255, 191, 0),
                size: 30,
              ),
              Icon(
                Icons.star,
                color: Color.fromARGB(255, 255, 191, 0),
                size: 30,
              ),
            ]),
            SizedBox(height: 22),
            Row(children: <Widget>[
              Text(
                "Quick Details:",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ]),
            SizedBox(height: 16),
            Text(
              "A flower, also known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). Flowers consist of a combination of vegetative organs – sepals that enclose and protect the developing flower, petals that attract pollinators, and reproductive organs that produce gametophytes, which in flowering plants produce gametes. The male gametophytes, which produce sperm, are enclosed within pollen grains produced in the anthers. The female gametophytes are contained within the ovules produced in the carpels.",
              style: TextStyle(
                fontSize: 18,
              ),
              maxLines: isShowMore ? 3 : null,
              overflow: TextOverflow.fade,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    isShowMore = !isShowMore;
                  });
                },
                child: Text(
                  isShowMore ? "Show more" : "Show less",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
          ]),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(255, 233, 236, 238),
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 204, 212, 220)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.only(left: 40, right: 40)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                  ),
                  child: Text(
                    "Chat now",
                    style: TextStyle(fontSize: 19, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    cart.add(widget.items);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 195, 217, 240)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.only(left: 40, right: 40)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                  ),
                  child: Text(
                    "Add to cart",
                    style: TextStyle(fontSize: 19, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
