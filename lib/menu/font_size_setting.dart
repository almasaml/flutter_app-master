import 'package:flutter/material.dart';
import 'package:flutter_app/utils/storage.dart';

class FontSizeSetting extends StatefulWidget {
  const FontSizeSetting({super.key});

  @override
  State<FontSizeSetting> createState() => _FontSizeSettingState();
}

class _FontSizeSettingState extends State<FontSizeSetting> {
  double fontScale = 14;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fontScale = Storage.fontScale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ukuran Teks"),
      ),
      body: Column(
        children: [
          //
          RadioListTile<double>(
              value: 0.8,
              groupValue: fontScale,
              title: Text("Kecil"),
              onChanged: (value) {
                setState(() {
                  fontScale = value!;
                });
                Storage.setFontScale(value!);
              }),
          RadioListTile<double>(
              value: 1.0,
              groupValue: fontScale,
              title: Text("Normal"),
              onChanged: (value) {
                setState(() {
                  fontScale = value!;
                });
                Storage.setFontScale(value!);
              }),
          RadioListTile<double>(
              value: 1.25,
              groupValue: fontScale,
              title: Text("Medium"),
              onChanged: (value) {
                setState(() {
                  fontScale = value!;
                });
                Storage.setFontScale(value!);
              }),
          RadioListTile<double>(
              value: 1.5,
              groupValue: fontScale,
              title: Text("Besar"),
              onChanged: (value) {
                setState(() {
                  fontScale = value!;
                });
                Storage.setFontScale(value!);
              }),
        ],
      ),
    );
  }
}
