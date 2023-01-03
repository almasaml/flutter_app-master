// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/menu/font_size_setting.dart';
import 'package:flutter_app/menu/tampilan_hadist_pilihan_setting.dart';
import 'package:flutter_app/menu/tampilan_hadist_setting.dart';

class Pengaturan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pengaturan"),
        ),
        body: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.format_size,
                  color: Colors.blue,
                ),
                title: Text('Ukuran Teks'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FontSizeSetting(),
                      ));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.view_module,
                  color: Colors.blue,
                ),
                title: Text('Tampilan hadis'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TampilanHadistSetting(),
                      ));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.view_carousel,
                  color: Colors.blue,
                ),
                title: Text('Tampilan hadis pilihan'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TampilanHadistPilihanSetting(),
                      ));
                },
              ),
            ),
          ],
        ));
  }
}
