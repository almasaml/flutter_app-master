// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_app/menu/mukhtarulHadist_old.dart';
import 'package:flutter_app/model/hadistArabModel.dart';
import 'package:flutter_app/model/hadist_pilihan.dart';
import 'package:flutter_app/model/mode_bahasa_model.dart';
import 'package:flutter_app/utils/storage.dart';
import 'package:flutter_app/utils/visible_widget.dart';
import 'package:sizer/sizer.dart';

class DetailHadistPilihan extends StatefulWidget {
  const DetailHadistPilihan({Key? key, required this.model}) : super(key: key);

  final HadistPilihanModel model;

  @override
  // ignore: unnecessary_new
  _DetailHadistPilihanState createState() => new _DetailHadistPilihanState();
}

class _DetailHadistPilihanState extends State<DetailHadistPilihan> {
  late ModeBahasaModel bahasaModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bahasaModel = Storage.hadistPilihanBahasa;
    print(bahasaModel.toJson());
  }

  @override
  Widget build(BuildContext context) {
    final double scale = Storage.fontScale;
    return Scaffold(
        appBar: AppBar(
          title: Text("Hadis Bab ${widget.model.arab.id.toString()}"),
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    VisibleWidget(
                      visible: bahasaModel.arab,
                      child: Text(
                        "${widget.model.arab.title}",
                        style: TextStyle(color: Colors.white, fontSize: 16.0 * scale),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    VisibleWidget(
                      visible: bahasaModel.indonesia,
                      child: Text(
                        "PELAJARAN TENTANG ${widget.model.indonesia.title}",
                        style: TextStyle(color: Colors.white, fontSize: 16.0 * scale, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    VisibleWidget(
                      visible: bahasaModel.jawa,
                      child: Text(
                        "${widget.model.jawa.title}",
                        style: TextStyle(color: Colors.white, fontSize: 16.0 * scale),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                )),
            Text(
              "Hadis",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0 * scale),
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
                          width: 100.w,
                          decoration: BoxDecoration(color: Color.fromARGB(255, 234, 234, 235), borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          margin: EdgeInsets.only(
                            right: 12,
                            left: 12,
                            bottom: 8,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Text(
                                  widget.model.indonesia.hadist[index].id.toString(),
                                ),
                              ),
                              Expanded(
                                child: Wrap(
                                  children: [
                                    VisibleWidget(
                                      visible: bahasaModel.arab,
                                      child: ListTile(
                                        title: Text(
                                          widget.model.arab.hadist[index].value.toString(),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(fontSize: 16 * scale),
                                        ),
                                      ),
                                    ),
                                    Divider(),
                                    VisibleWidget(
                                      visible: bahasaModel.indonesia,
                                      child: ListTile(
                                        title: Text(
                                          widget.model.indonesia.hadist[index].value.toString(),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(fontSize: 16 * scale),
                                        ),
                                      ),
                                    ),
                                    Divider(),
                                    VisibleWidget(
                                      visible: bahasaModel.jawa,
                                      child: ListTile(
                                        title: Text(
                                          widget.model.jawa.hadist[index].value.toString(),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(fontSize: 16 * scale),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
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
            widget.model.arab.firman[0].value == null
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Text(widget.model.indonesia.firman[index].id.toString()),
                              ),
                              Expanded(
                                child: Wrap(
                                  children: [
                                    VisibleWidget(
                                      visible: bahasaModel.arab,
                                      child: ListTile(
                                        title: Text(
                                          widget.model.arab.firman[index].value.toString(),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(fontSize: 16 * scale),
                                        ),
                                      ),
                                    ),
                                    Divider(),
                                    VisibleWidget(
                                      visible: bahasaModel.indonesia,
                                      child: ListTile(
                                        title: Text(
                                          widget.model.indonesia.firman[index].value.toString(),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(fontSize: 16 * scale),
                                        ),
                                      ),
                                    ),
                                    Divider(),
                                    VisibleWidget(
                                      visible: bahasaModel.jawa,
                                      child: ListTile(
                                        title: Text(
                                          widget.model.jawa.firman[index].value.toString(),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(fontSize: 16 * scale),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ));
                    }),
          ],
        )));
  }
}
