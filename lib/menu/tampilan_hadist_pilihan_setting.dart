import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/model/mode_bahasa_model.dart';
import 'package:flutter_app/utils/storage.dart';

class TampilanHadistPilihanSetting extends StatefulWidget {
  const TampilanHadistPilihanSetting({super.key});

  @override
  State<TampilanHadistPilihanSetting> createState() => _TampilanHadistPilihanSettingState();
}

class _TampilanHadistPilihanSettingState extends State<TampilanHadistPilihanSetting> {
  late ModeBahasaModel bahasaModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bahasaModel = Storage.allHadistBahasa;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bahasa Hadist Pilihan"),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            value: bahasaModel.jawa,
            title: Text("Bahasa Jawa"),
            onChanged: (value) {
              setState(() {
                bahasaModel.jawa = value!;
              });
              Storage.setAllHadistBahasa(bahasaModel);
            },
          ),
          CheckboxListTile(
            value: bahasaModel.indonesia,
            title: Text("Bahasa Indonesia"),
            onChanged: (value) {
              setState(() {
                bahasaModel.indonesia = value!;
              });
              Storage.setAllHadistBahasa(bahasaModel);
            },
          ),
          CheckboxListTile(
            value: bahasaModel.arab,
            title: Text("Bahasa Arab"),
            onChanged: (value) {
              setState(() {
                bahasaModel.arab = value!;
              });
              Storage.setAllHadistBahasa(bahasaModel);
            },
          ),
        ],
      ),
    );
  }
}
