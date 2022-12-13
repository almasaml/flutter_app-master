import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_app/model/arabModel.dart';
import 'package:sizer/sizer.dart';

import '../utils/storage.dart';

class MukhtarulHadist extends StatefulWidget {
  const MukhtarulHadist({Key? key}) : super(key: key);

  @override
  State<MukhtarulHadist> createState() => _MukhtarulHadistState();
}

class _MukhtarulHadistState extends State<MukhtarulHadist> {
  final double scale = Storage.fontScale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 233, 233, 233),
        width: double.infinity,
        height: double.infinity,
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  floating: true,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      "assets/images/bg.jpg",
                      fit: BoxFit.cover,
                    ),
                    title: Text('Terjemahan Mukhtarul Ahadist', style: TextStyle(fontSize: 16.sp), textAlign: TextAlign.center),
                  ),
                  expandedHeight: 25.h,
                ),
              ];
            },
            body: FutureBuilder(
              future: ReadJsonData(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(child: Text("${data.error}"));
                } else if (data.hasData) {
                  var items = data.data as List<ArabDataModel>;
                  return ListView.builder(itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.all(16),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      items[index].value.toString(),
                                      style: TextStyle(fontSize: 16 * scale, fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      '<b>Terjemahan Indonesia</b> \n${items[index].valueIndonesia.toString()}',
                                      style: TextStyle(fontSize: 16 * scale),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      '<b>Terjemahan Jawa</b> \n${items[index].valueJawa.toString()}',
                                      style: TextStyle(fontSize: 16 * scale),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
      ),
    );
  }

  Future<List<ArabDataModel>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/arab.json');
    final jsondata2 = await rootBundle.rootBundle.loadString('jsonfile/indonesia.json');
    final jsondata3 = await rootBundle.rootBundle.loadString('jsonfile/jawa.json');
    final list = json.decode(jsondata) as List<dynamic>;
    final list2 = json.decode(jsondata2) as List<dynamic>;
    final list3 = json.decode(jsondata3) as List<dynamic>;

    for (int i = 0; i < 488; i++) {
      list[i].addAll(list2[i]);
      list[i].addAll(list3[i]);
    }
    return list.map((e) => ArabDataModel.fromJson(e)).toList();
  }
}
