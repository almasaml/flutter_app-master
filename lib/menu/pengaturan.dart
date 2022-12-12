import 'package:flutter/material.dart';

class Pengaturan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text("Pengaturan"),
        ),
        body: ListView(
                  children: const <Widget>[
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.format_size, color: Colors.blue,),
                        title: Text('Ukuran Teks'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.view_module, color: Colors.blue,),
                        title: Text('Tampilan hadist'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.view_carousel, color: Colors.blue,),
                        title: Text('Tampilan hadist pilihan'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    ),
                  ],
                )
      ),
    );
  }
  
}