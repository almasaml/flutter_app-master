// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_app/menu/hadist_pilihan_bab.dart';
import 'package:flutter_app/menu/mukhtarulHadist.dart';
import 'package:flutter_app/model/arabModel.dart';
import 'package:flutter_app/model/hadist_pilihan.dart';
import 'package:sizer/sizer.dart';

class HadistPilihan extends StatefulWidget {
  const HadistPilihan({Key? key}) : super(key: key);

  @override
  State<HadistPilihan> createState() => _HadistPilihanState();
}

class _HadistPilihanState extends State<HadistPilihan> {
  List<HadistPilihanModel> allHadist = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    List<HadistPilihanModel> _allHadist = [];

    setState(() {
      isLoading = true;
    });
    final jsondata = await rootBundle.rootBundle
        .loadString('jsonfile/hadistpilihanarab.json');
    final jsondata2 = await rootBundle.rootBundle
        .loadString('jsonfile/hadistpilihanindo.json');
    final jsondata3 = await rootBundle.rootBundle
        .loadString('jsonfile/hadistpilihanjawa.json');
    final list = json.decode(jsondata) as List<dynamic>;
    final list2 = json.decode(jsondata2) as List<dynamic>;
    final list3 = json.decode(jsondata3) as List<dynamic>;

    for (int i = 0; i < list.length; i++) {
      Map<String, dynamic> temp = {};
      temp['arab'] = list[i];
      temp['indonesia'] = list2[i];
      temp['jawa'] = list3[i];
      var model = HadistPilihanModel.fromJson(temp);
      _allHadist.add(model);
    }

    setState(() {
      allHadist = _allHadist;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hadist - Hadist Pilihan"),
          automaticallyImplyLeading: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(16),
          width: double.infinity,
          height: double.infinity,
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    backgroundHeader(),
                    Container(height: 12.0),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 234, 234, 235),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(bottom: 12),
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text("1"),
                          ),
                          title: Text('Bab 1 - Bab 10'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HadistPilihanBab(
                                        dataHadist:
                                            allHadist.getRange(0, 10).toList(),
                                        titlePage: "Hadist Bab 1 - Bab 10")));
                          }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 234, 234, 235),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(bottom: 12),
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text("2"),
                          ),
                          title: Text('Bab 11 - Bab 20'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HadistPilihanBab(
                                        dataHadist:
                                            allHadist.getRange(10, 20).toList(),
                                        titlePage: "Hadist Bab 11 - Bab 20")));
                          }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 234, 234, 235),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(bottom: 12),
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text("3"),
                          ),
                          title: Text('Bab 21 - Bab 30'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HadistPilihanBab(
                                        dataHadist:
                                            allHadist.getRange(20, 30).toList(),
                                        titlePage: "Hadist Bab 21 - Bab 30")));
                          }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 234, 234, 235),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(bottom: 12),
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text("4"),
                          ),
                          title: Text('Bab 31 - Bab 40'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HadistPilihanBab(
                                        dataHadist:
                                            allHadist.getRange(30, 40).toList(),
                                        titlePage: "Hadist Bab 31 - Bab 40")));
                          }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 234, 234, 235),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(bottom: 12),
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text("5"),
                          ),
                          title: Text('Bab 41 - Bab 50'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HadistPilihanBab(
                                        dataHadist:
                                            allHadist.getRange(40, 50).toList(),
                                        titlePage: "Hadist Bab 41 - Bab 50")));
                          }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 234, 234, 235),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(bottom: 12),
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text("6"),
                          ),
                          title: Text('Bab 51 - Bab 60'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HadistPilihanBab(
                                        dataHadist:
                                            allHadist.getRange(50, 60).toList(),
                                        titlePage: "Hadist Bab 51 - Bab 60")));
                          }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 234, 234, 235),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(bottom: 12),
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text("7"),
                          ),
                          title: Text('Bab 61 - Bab 70'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HadistPilihanBab(
                                        dataHadist:
                                            allHadist.getRange(60, 70).toList(),
                                        titlePage: "Hadist Bab 61 - Bab 70")));
                          }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 234, 234, 235),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(bottom: 12),
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text("8"),
                          ),
                          title: Text('Bab 71 - Bab 79'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HadistPilihanBab(
                                        dataHadist:
                                            allHadist.getRange(70, 79).toList(),
                                        titlePage: "Hadist Bab 70 - Bab 79")));
                          }),
                    ),
                  ],
                ),
        ));
  }
}

Widget backgroundHeader() {
  return Container(
    height: 30.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      image: DecorationImage(
        image: AssetImage("assets/images/bg.jpg"),
        fit: BoxFit.cover, //change image fill type
      ),
    ),
  );
}

Widget buttonBab1(context) {
  return Container(
    height: 8.h,
    width: 90.w,
    margin: const EdgeInsets.only(right: 24, left: 24),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MukhtarulHadist()));
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          primary: Colors.blue,
        ),
        child: Text(
          "Bab 1 - Bab 10",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget buttonBab2(context) {
  return Container(
    height: 8.h,
    width: 90.w,
    margin: const EdgeInsets.only(right: 24, left: 24),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MukhtarulHadist()));
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 140.0, vertical: 25.0),
          primary: Colors.blue,
        ),
        child: Text(
          "Bab 11 - Bab 20",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget buttonBab3() {
  return Container(
    height: 8.h,
    width: 90.w,
    margin: const EdgeInsets.only(right: 24, left: 24),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 140.0, vertical: 25.0),
          primary: Colors.blue,
        ),
        child: Text(
          "Bab 21 - Bab 30",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget buttonBab4() {
  return Container(
    height: 8.h,
    width: 90.w,
    margin: const EdgeInsets.only(right: 24, left: 24),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 140.0, vertical: 25.0),
          primary: Colors.blue,
        ),
        child: Text(
          "Bab 31 - Bab 40",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget buttonBab5() {
  return Container(
    height: 8.h,
    width: 90.w,
    margin: const EdgeInsets.only(right: 24, left: 24),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 140.0, vertical: 25.0),
          primary: Colors.blue,
        ),
        child: Text(
          "Bab 41 - Bab 50",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget buttonBab6() {
  return Container(
    height: 8.h,
    width: 90.w,
    margin: const EdgeInsets.only(right: 24, left: 24),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 140.0, vertical: 25.0),
          primary: Colors.blue,
        ),
        child: Text(
          "Bab 51 - Bab 60",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget buttonBab7() {
  return Container(
    height: 8.h,
    width: 90.w,
    margin: const EdgeInsets.only(right: 24, left: 24),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 140.0, vertical: 25.0),
          primary: Colors.blue,
        ),
        child: Text(
          "Bab 61 - Bab 70",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
  ;
}

Widget buttonBab8() {
  return Container(
    height: 8.h,
    width: 90.w,
    margin: const EdgeInsets.only(right: 24, left: 24, bottom: 32),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 140.0, vertical: 25.0),
          primary: Colors.blue,
        ),
        child: Text(
          "Bab 71 - Bab 79",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
