import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_app/menu/beranda.dart';
import 'package:flutter_app/menu/jadwalsholat.dart';
import 'package:flutter_app/menu/pengaturan.dart';
import 'package:flutter_app/splashscreen.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp())); 
} 

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
      }
    ); 
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedNavbar = 0;
  final List<Widget> _children = [
    Beranda(),
    JadwalSholat(),
    Pengaturan()
  ];

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Terjemahan Mukhtarul Ahadist"),
      // ),
      body: _children[_selectedNavbar],
      
      bottomNavigationBar: ConvexAppBar(
        height: 68,
        items: [
          TabItem(icon: Icons.home, title: 'Beranda'),
          TabItem(icon: Icons.access_alarm, title: 'Jadwal'),
          TabItem(icon: Icons.settings, title: 'Pengaturan'),
        ],
        initialActiveIndex: _selectedNavbar,
        onTap: _changeSelectedNavBar,
      ),      

    );
  }
}
