import 'package:dots_indicator/dots_indicator.dart';
import 'package:eccomerce/page_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardScreen(),
    ),
  );
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentPageIndex = 0;
  int pageLemgth;

  @override
  void initState() {
    currentPageIndex = 0;
    pageLemgth = 4;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView(
            physics: BouncingScrollPhysics(),
            children: [
              BoardingFirst(),
              BoardingSecond(),
              BoardingThird(),
              BoardingFourth(),
            ],
            onPageChanged: (value) {
              setState(() {
                currentPageIndex = value;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DotsIndicator(
                  dotsCount: pageLemgth,
                  position: currentPageIndex.toDouble(),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class BoardingFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 4,
            child: Image.asset(
              "assets/images/one1.png",
            )),
        Flexible(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "One Stop Shopping",
              style: TextStyle(color: Colors.grey[100]),
            )
          ],
        ))
      ],
    );
  }
}

class BoardingSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 4,
            child: Image.asset(
              "assets/images/garansi.png",
            )),
      ],
    );
  }
}

class BoardingThird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 4, child: Image.asset("assets/images/diskon.png")),
      ],
    );
  }
}

class BoardingFourth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(flex: 4, child: Image.asset("assets/images/pay.png")),
        RaisedButton(
          elevation: 30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Colors.orangeAccent,
          child: Text("Next",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeProduct(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class HomeProduct extends StatefulWidget {
  @override
  _HomeProductState createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  Future<List> getData() async {
    final response =
        await http.get("http://192.168.1.4/flutter_ecco/data_notes_awal.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("PALUGADA MART")),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? DataNotes(list: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class DataNotes extends StatelessWidget {
  final List list;
  DataNotes({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => DetailPage(
                      list: list,
                      index: i,
                    ))),
            child: Container(
              child: Card(
                child: ListTile(
                  title: Text(list[i]['kategori']),
                  leading: Icon(
                    Icons.book,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetailPage extends StatefulWidget {
  List list;
  int index;
  DetailPage({this.index, this.list});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("${widget.list[widget.index]['kategori']}")),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              widget.list[widget.index]['kategori'],
              style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
            SizedBox(height: 30),
            Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                color: Colors.blueGrey[200],
                child: Center(
                  child: Text(
                    widget.list[widget.index]['produk'],
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                )),
            SizedBox(
              height: 200,
            ),
            RaisedButton(
              elevation: 30,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.blue[200],
              child: Text("Log out",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageLogin(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
