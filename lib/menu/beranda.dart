import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/menu/hadistPilihan.dart';
import 'package:flutter_app/menu/mukhtarulHadist.dart';
import 'package:flutter_app/styles/color.dart';
import 'package:flutter_app/styles/typo.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Terjemahan Mukhtarul Ahadist"),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          margin: const EdgeInsets.all(16),
          width: double.infinity,
          height: double.infinity,
          child: Column(children: [
            backgroundHeader(),
            Container(height: 12.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.blue),
              padding: EdgeInsets.all(16),
              child: Text(
                "Mukhtarul Hadist ialah kitab Hadist yang mencakup hadist-hadist shahih menjadi satu, Hadist yang mengandung arti mengenai hukum, budi pekerti atau akhlak, etika bersosialisasi serta hal-hal terbaik lain yang tentu saja untuk dijadikan panutan bagi kaum muslimin dalam kehidupan bermasyarakat.",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(height: 20.0),
            Container(
              decoration: BoxDecoration(color: Color.fromARGB(255, 234, 234, 235), borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(bottom: 12),
              child: ListTile(
                  leading: Icon(
                    Icons.library_books,
                    color: Colors.blue,
                  ),
                  title: Text("Mukhtarul Ahadist (ا - ت)"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MukhtarulHadist()));
                  }),
            ),
            Container(
              decoration: BoxDecoration(color: Color.fromARGB(255, 234, 234, 235), borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(bottom: 12),
              child: ListTile(
                  leading: Icon(Icons.note, color: Colors.blue),
                  title: Text("Hadist - Hadist Pilihan"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HadistPilihan()));
                  }),
            ),
            Container(height: 12.0),
          ]),
        ));
  }
}

Widget backgroundHeader() {
  return Container(
      height: 30.h,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage("assets/images/mh.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ));
}

Widget backgroundHeaderexp() {
  return Container(
      margin: const EdgeInsets.all(16),
      height: 40.h,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage("assets/images/mh.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromARGB(99, 0, 0, 0),
                ),
                height: 15.h,
                padding: EdgeInsets.all(16),
                child: Text(
                  "Mukhtarul Hadist ialah kitab Hadist yang mencakup hadist-hadist shahih menjadi satu, Hadist yang mengandung arti mengenai hukum, budi pekerti atau akhlak, etika bersosialisasi serta hal-hal terbaik lain yang tentu saja untuk dijadikan panutan bagi kaum muslimin dalam kehidupan bermasyarakat.",
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ));
}
