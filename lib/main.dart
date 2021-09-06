import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Emre's Blog",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: "Emre's Blog"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Color kBackgroundColor = Color(0xFF192023);
Color kCellColor = Color(0xFF333439);

class _MyHomePageState extends State<MyHomePage> {
  ScrollController mainScrollController = ScrollController();

  double mainImageTopOffset = -100.0;

  @override
  void initState() {
    super.initState();
    mainScrollController.addListener(() {
      //
      setState(() {
        mainImageTopOffset = (mainScrollController.offset * -0.5) - 100;
      });
    });
  }

  AppBar navbar() {
    return AppBar(
      title: Row(
        children: [
          SizedBox(width: 80),
          Expanded(child: Text(widget.title)),
          Text("Home"),
          SizedBox(width: 30),
          Text("Blog"),
          SizedBox(width: 80),
        ],
      ),
    );
  }

  Widget articleCell() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: const Text(
          'It is coming...',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 22,
          ),
        ),
      ),
      // color: Colors.black54,
      decoration: BoxDecoration(
          color: kCellColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withAlpha(10),
              spreadRadius: 5,
              blurRadius: 5,
            )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navbar(),
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Stack(
          children: [
            /* Positioned(
              left: 0,
              right: 0,
              top: mainImageTopOffset,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/header.jpg",
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ), */
            Positioned.fill(
              child: SingleChildScrollView(
                controller: mainScrollController,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 400,
                    left: 100,
                    right: 100,
                  ),
                  child: GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 50,
                    crossAxisCount: 3,
                    children: <Widget>[
                      articleCell(),
                      articleCell(),
                      articleCell(),
                      articleCell(),
                      articleCell(),
                      articleCell(),
                      articleCell(),
                      articleCell(),
                      articleCell(),
                      articleCell(),
                      articleCell(),
                      articleCell(),
                      articleCell(),
                      articleCell(),
                      articleCell(),
                      articleCell(),
                      articleCell(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
