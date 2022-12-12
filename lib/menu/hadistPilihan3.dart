import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_app/menu/detailhadistPilihan.dart';
import 'package:flutter_app/menu/mukhtarulHadist.dart';
import 'package:flutter_app/model/hadistArabModel.dart';
import 'package:sizer/sizer.dart';

class HadistPilihan3 extends StatefulWidget {
  const HadistPilihan3({Key? key}) : super(key: key);

  @override
  State<HadistPilihan3> createState() => _HadistPilihan3State();
}

class _HadistPilihan3State extends State<HadistPilihan3> {
  List _get = [];
  List _getArab = [];

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _getData();
    _getDataArab();
  }

  Future _getData() async {
    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/hadistpilihanindo.json');
    final data = jsonDecode(jsondata);
    print(data);
    setState(() {
      print(_get);
      _get = data.sublist(20, 30);
    });
    // return HadistArabModel.fromJson(jsonDecode(jsondata));
  }

  Future _getDataArab() async {
    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/hadistpilihanarab.json');
    final data = jsonDecode(jsondata);
    print(data);
    setState(() {
      print(_get);
      _getArab = data.sublist(20, 30);
    });
    // return HadistArabModel.fromJson(jsonDecode(jsondata));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hadist Bab 21 - Bab 30"),
          automaticallyImplyLeading: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(16),
          width: double.infinity,
          height: double.infinity,
          child: _get.length == 0
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: _get.length,
                  itemBuilder: (context, index) {
                    if (index != '') {
                      return Container(
                          decoration: BoxDecoration(color: Color.fromARGB(255, 234, 234, 235), borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text(_get[index]['id'].toString()),
                            ),
                            title: Text(
                              _get[index]['title'] ?? "No Title",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            //onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (DetailHadistPilihan1(index))));}
                          ));
                    }

                    return const CircularProgressIndicator();
                  },
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
