import 'package:flutter/material.dart';
import 'package:markting/activepage.dart';
import 'package:markting/login.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});
  static const String screenRout = 'welcom';

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          //width make it big as my
          //mediaQuery make abig as per the secreen
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),

          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "application markting shop",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/welcome.png'))),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      ///
                      decoration: BoxDecoration(
                          // gradient: LinearGradient(colors: [
                          //   Color.fromRGBO(65, 58, 251, 0.779),
                          //   Color.fromRGBO(143, 140, 251, 22)
                          // ]),
                          borderRadius: BorderRadius.circular(20)),
                      child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => activepage()));
                          },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(50)),
                          minWidth: double.infinity,
                          height: 60,
                          child: Text(
                            'Active APP',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 15,
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
                            Color.fromRGBO(65, 58, 251, 0.779),
                            Color.fromRGBO(143, 140, 251, 22)
                          ]),
                          borderRadius: BorderRadius.circular(20)),
                      child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => login()));
                          },
                          // shape: RoundedRectangleBorder(
                          //     side: BorderSide(color: Colors.black),
                          //     borderRadius: BorderRadius.circular(50)),
                          minWidth: double.infinity,
                          height: 60,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ),

                    ///
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
