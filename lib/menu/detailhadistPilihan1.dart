import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_app/menu/mukhtarulHadist.dart';
import 'package:flutter_app/model/hadistArabModel.dart';
import 'package:sizer/sizer.dart';

class DetailHadistPilihan1 extends StatefulWidget {
  DetailHadistPilihan1({Key? key, required this.arab}) : super(key: key);

  final HadistArabModel arab;

  @override
  _DetailHadistPilihanState createState() => new _DetailHadistPilihanState();
}

class _DetailHadistPilihanState extends State<DetailHadistPilihan1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hadist Bab ${widget.arab.id.toString()}"),
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Stack(children: <Widget>[
              Container(
                margin: EdgeInsets.all(16),
                height: 35.h,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16)),
              ),
              Container(
                  margin: EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Text(
                        "${widget.arab.titleArab}",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "PELAJARAN TENTANG ${widget.arab.title}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${widget.arab.titleJawa}",
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
            widget.arab.hadist == ''
                ? CircularProgressIndicator()
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.arab.hadist!.length,
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 234, 234, 235),
                              borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.all(4),
                          margin:
                              EdgeInsets.only(right: 12, left: 12, bottom: 8),
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text(
                                      widget.arab.hadist![index].id.toString()),
                                ),
                                title: Text(
                                    widget.arab.hadist![index].valueJawa
                                            .toString() ??
                                        "",
                                    textAlign: TextAlign.justify),
                              ),
                              ListTile(
                                title: Text(
                                    widget.arab.hadist![index].value
                                            .toString() ??
                                        "",
                                    textAlign: TextAlign.justify),
                              ),
                              ListTile(
                                title: Text(
                                    widget.arab.hadist![index].valueJawa
                                            .toString() ??
                                        "",
                                    textAlign: TextAlign.justify),
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
            widget.arab.firman![0].value == 'null'
                ? Text("Firman belum tercantum")
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.arab.firman!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 234, 234, 235),
                            borderRadius: BorderRadius.circular(16)),
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.only(right: 12, left: 12, bottom: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child:
                                Text(widget.arab.firman![index].id.toString()),
                          ),
                          title: Text(
                              widget.arab.firman![index].value.toString() ?? "",
                              textAlign: TextAlign.justify),
                        ),
                      );
                    }),
          ],
        )));
  }
}
