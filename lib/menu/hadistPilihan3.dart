import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_app/menu/detailhadistPilihan.dart';
import 'package:flutter_app/menu/mukhtarulHadist.dart';
import 'package:flutter_app/model/hadistArabModel.dart';
import 'package:sizer/sizer.dart';

import '../model/hadist_pilihan.dart';

class HadistPilihan3 extends StatefulWidget {
  const HadistPilihan3({Key? key}) : super(key: key);

  @override
  State<HadistPilihan3> createState() => _HadistPilihan3State();
}

class _HadistPilihan3State extends State<HadistPilihan3> {
  List<HadistPilihanModel> allHadist = [];
  int lengthdata = 10;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  Future<List<HadistPilihanModel?>> _getData() async {
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
      allHadist.add(model);
    }

    allHadist = allHadist.sublist(20, 31);

    return allHadist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hadist Bab 21 - Bab 30"),
          automaticallyImplyLeading: true,
        ),
        body: FutureBuilder<List<HadistPilihanModel?>>(
            future: _getData(),
            builder: (context, data) {
              if (data.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (data.hasData) {
                  var items = data.data;
                  return ListView.builder(
                    itemCount: data == null ? 0 : lengthdata,
                    itemBuilder: (context, index) {
                      if (data.hasData) {
                        return Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 234, 234, 235),
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.only(top: 12, bottom: 12),
                            margin: const EdgeInsets.only(bottom: 12),
                            child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text(
                                      items![index]!.indonesia.id.toString()),
                                ),
                                title: Text(
                                  items[index]!.indonesia.title ?? "No Title",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                ),
                                trailing: Icon(Icons.keyboard_arrow_right),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              (DetailHadistPilihan(
                                                  model: items[index]!))));
                                }));
                      }

                      return const CircularProgressIndicator();
                    },
                  );
                } else {
                  return Center(child: Text("Tidak Ada Data"));
                }
              }
            }));
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
