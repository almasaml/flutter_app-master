import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_app/menu/mukhtarulHadist.dart';
import 'package:flutter_app/model/hadistArabModel.dart';
import 'package:flutter_app/model/hadist_pilihan.dart';
import 'package:sizer/sizer.dart';

class DetailHadistPilihan1 extends StatefulWidget {
  DetailHadistPilihan1({Key? key, required this.model}) : super(key: key);

  final HadistPilihanModel model;

  @override
  _DetailHadistPilihanState createState() => new _DetailHadistPilihanState();
}

class _DetailHadistPilihanState extends State<DetailHadistPilihan1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hadist Bab ${widget.model.arab.id.toString()}"),
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Stack(children: <Widget>[
              Container(
                margin: EdgeInsets.all(16),
                height: 35.h,
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(16)),
              ),
              Container(
                  margin: EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Text(
                        "${widget.model.arab.title}",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "PELAJARAN TENTANG ${widget.model.indonesia.title}",
                        style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${widget.model.jawa.title}",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
            ]),
            Text(
              "Hadist",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Container(
              height: 1.h,
            ),
            widget.model == null
                ? CircularProgressIndicator()
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.model.arab.hadist.length,
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(color: Color.fromARGB(255, 234, 234, 235), borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.only(right: 12, left: 12, bottom: 8),
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text(widget.model.indonesia.hadist[index].id.toString()),
                                ),
                                title: Text(widget.model.arab.hadist[index].value.toString(), textAlign: TextAlign.justify),
                              ),
                              ListTile(
                                title: Text(widget.model.indonesia.hadist[index].value.toString(), textAlign: TextAlign.justify),
                              ),
                              ListTile(
                                title: Text(widget.model.jawa.hadist[index].value.toString(), textAlign: TextAlign.justify),
                              ),
                            ],
                          ));
                    }),
            Container(
              height: 2.h,
            ),
            Text(
              "Firman",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Container(
              height: 1.h,
            ),
            widget.model == null
                ? Text("Firman belum tercantum")
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.model.arab.firman.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(color: Color.fromARGB(255, 234, 234, 235), borderRadius: BorderRadius.circular(16)),
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.only(right: 12, left: 12, bottom: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text(widget.model.arab.firman![index].id.toString()),
                          ),
                          title: Text(widget.model.arab.firman![index].value.toString() ?? "", textAlign: TextAlign.justify),
                        ),
                      );
                    }),
          ],
        )));
  }
}
