// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_app/model/arabModel.dart';
import 'package:flutter_app/model/mode_bahasa_model.dart';
import 'package:flutter_app/utils/visible_widget.dart';
import 'package:sizer/sizer.dart';

import '../utils/storage.dart';

class MukhtarulHadist extends StatefulWidget {
  const MukhtarulHadist({Key? key}) : super(key: key);

  @override
  State<MukhtarulHadist> createState() => _MukhtarulHadistState();
}

class _MukhtarulHadistState extends State<MukhtarulHadist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 233, 233, 233),
        width: double.infinity,
        height: double.infinity,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: false,
              pinned: false,
              // title: Text('Terjemahan Mukhtarul Ahadist', textAlign: TextAlign.center),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/images/bg.jpg",
                  fit: BoxFit.cover,
                ),
                title: Text('Terjemahan Mukhtarul Ahadis'),
              ),
              expandedHeight: 20.h,
            ),
            SliverFillRemaining(
              child: FutureBuilder(
                future: readJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(child: Text("${data.error}"));
                  } else if (data.hasData) {
                    var items = data.data as List<ArabDataModel>;
                    return ListView.builder(itemBuilder: (context, index) {
                      return HadistListItem(
                          arab: items[index].value.toString(),
                          indonesia: items[index].valueIndonesia.toString(),
                          jawa: items[index].valueJawa.toString(),
                          ayat: items[index].id.toString());
                    });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<ArabDataModel>> readJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfile/arab.json');
    final jsondata2 =
        await rootBundle.rootBundle.loadString('jsonfile/indonesia.json');
    final jsondata3 =
        await rootBundle.rootBundle.loadString('jsonfile/jawa.json');
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

class HadistListItem extends StatelessWidget {
  const HadistListItem({
    super.key,
    required this.ayat,
    required this.arab,
    required this.indonesia,
    required this.jawa,
  });

  final String ayat;
  final String arab;
  final String indonesia;
  final String jawa;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: _Hadist(
              arab: arab,
              indonesia: indonesia,
              jawa: jawa,
            ),
          ),
          Center(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              width: 40,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  ayat,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class _Hadist extends StatelessWidget {
  const _Hadist({
    required this.arab,
    required this.indonesia,
    required this.jawa,
  });

  final String arab;
  final String indonesia;
  final String jawa;

  @override
  Widget build(BuildContext context) {
    final double scale = Storage.fontScale;
    final ModeBahasaModel bahasaModel = Storage.allHadistBahasa;

    return Container(
      width: 100.w,
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          VisibleWidget(
            visible: bahasaModel.arab,
            child: Text(
              arab,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0 * scale,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          VisibleWidget(
            visible: bahasaModel.indonesia,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                Text(
                  "Terjemahan Indonesia :",
                  style: TextStyle(
                      fontSize: 14.0 * scale, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  indonesia,
                  style: TextStyle(fontSize: 14.0 * scale),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          VisibleWidget(
            visible: bahasaModel.jawa,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                Text(
                  "Terjemahan Jawa :",
                  style: TextStyle(
                      fontSize: 14.0 * scale, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  jawa,
                  style: TextStyle(fontSize: 14.0 * scale),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Container(height: 16.0),
        ],
      ),
    );
  }
}
