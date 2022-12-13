import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_app/menu/detailhadistPilihan.dart';
import 'package:flutter_app/menu/mukhtarulHadist_old.dart';
import 'package:flutter_app/model/hadistArabModel.dart';
import 'package:sizer/sizer.dart';

import '../model/hadist_pilihan.dart';

class HadistPilihanBab extends StatefulWidget {
  const HadistPilihanBab({Key? key, required this.dataHadist, required this.titlePage}) : super(key: key);

  final List<HadistPilihanModel> dataHadist;
  final String titlePage;

  @override
  State<HadistPilihanBab> createState() => _HadistPilihanBabState();
}

class _HadistPilihanBabState extends State<HadistPilihanBab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.titlePage),
          automaticallyImplyLeading: true,
        ),
        body: ListView.builder(
          itemCount: widget.dataHadist.length,
          itemBuilder: (context, index) {
            var items = widget.dataHadist;
            return Container(
                decoration: BoxDecoration(color: const Color.fromARGB(255, 234, 234, 235), borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(items[index].indonesia.id.toString()),
                    ),
                    title: Text(
                      items[index].indonesia.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => (DetailHadistPilihan(model: items[index]))));
                    }));
          },
        ));
  }
}

Widget backgroundHeader() {
  return Container(
    height: 30.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      image: const DecorationImage(
        image: AssetImage("assets/images/bg.jpg"),
        fit: BoxFit.cover, //change image fill type
      ),
    ),
  );
}
