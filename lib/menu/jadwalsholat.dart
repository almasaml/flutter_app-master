library dropdown_search;

import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/jadwalSholatModel.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_app/my_flutter_app_icons.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(const JadwalSholat()));
}

class JadwalSholat extends StatefulWidget {
  const JadwalSholat({super.key});

  @override
  State<JadwalSholat> createState() => _JadwalSholatState();
}

class _JadwalSholatState extends State<JadwalSholat> {
  //inizialize variable
  List _get = [];
  String lokasi = '';
  String kodeLokasi = '';
  var formated = 'EEEE, d MMM, yyyy, HH:mm:ss';

  var formattedDate = "";
  var tgl = DateFormat('yyyy/MM/dd').format(DateTime.now());
  final _formKey = GlobalKey<FormState>();
  late Timer timer;

  @override
  void initState() {
    formattedDate = DateFormat(formated, "id_ID").format(DateTime.now());

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => realTimeClock());
    super.initState();
  }

  realTimeClock() {
    var tempDate = DateFormat(formated, "id_ID").format(DateTime.now());
    setState(() {
      formattedDate = tempDate;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Jadwal Sholat"),
        ),
        body: Container(
            color: Color.fromARGB(255, 233, 233, 233),
            width: double.infinity,
            height: double.infinity,
            child: ListView(
              children: [
                //SizedBox(height: 16),
                //card img masjid dan tangal
                backgroundHeader(formattedDate),
                SearchView(),
                //listview jadwal
                lokasi != null
                    ? SchedulePray()
                    : Text(
                        "Pilih Lokasi Anda",
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
              ],
            )),
      ),
    );
  }

  Widget SearchView() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 12, bottom: 12, left: 20),
      child: DropdownSearch<dynamic>(
        //you can design textfield here as you want
        dropdownSearchDecoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          hintText: "Pilih Lokasi",
        ),
        //have two mode: menu mode and dialog mode
        mode: Mode.MENU,
        //if you want show search box
        showSearchBox: true,
        //get data from the internet
        onFind: (text) async {
          var response = await http.get(Uri.parse("https://api.myquran.com/v1/sholat/kota/semua"));

          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);

            setState(() {
              _get = data;
            });
          }
          return _get as List<dynamic>;
        },

        //what do you want anfter item clicked
        onChanged: (value) {
          setState(() {
            lokasi = value['lokasi'];
            kodeLokasi = value['id'];
          });
        },

        //this data appear in dropdown after clicked
        itemAsString: (item) => item['lokasi'],
      ),
    );
  }

  Widget SchedulePray() {
    Future<jadwalSholatModel> fetchJadwalSholat() async {
      final apiUrl = Uri.parse("https://api.myquran.com/v1/sholat/jadwal/$kodeLokasi/$tgl");
      http.Response response = await http.get(apiUrl);

      return jadwalSholatModel.fromJson(jsonDecode(response.body));
    }

    return Container(
      margin: const EdgeInsets.all(16),
      child: FutureBuilder<jadwalSholatModel>(
        future: fetchJadwalSholat(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            var _imsak = snapshot.data!.data?.jadwal!.imsak;
            var _subuh = snapshot.data!.data?.jadwal!.subuh;
            var _dhuha = snapshot.data!.data?.jadwal!.dhuha;
            var _dzuhur = snapshot.data!.data?.jadwal!.dzuhur;
            var _ashar = snapshot.data!.data?.jadwal!.ashar;
            var _maghrib = snapshot.data!.data?.jadwal!.maghrib;
            var _isya = snapshot.data!.data?.jadwal!.isya;

            return Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      _imsak == null ? "Imsak" : "Imsak : $_imsak",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      MyFlutterApp.shalat_malam,
                      color: Colors.blue[500],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(
                      _subuh == null ? "Shubuh" : "Shubuh : $_subuh",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      MyFlutterApp.shalat_shubuh,
                      color: Colors.blue[500],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(
                      _dhuha == null ? "Dhuha" : "Dhuha : $_dhuha",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      MyFlutterApp.shalat_dhuha,
                      color: Colors.blue[500],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(
                      _dzuhur == null ? "Dzuhur" : "Dzuhur : $_dzuhur",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      MyFlutterApp.shalat_zhuhur,
                      color: Colors.blue[500],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(
                      _ashar == null ? "Ashar" : "Ashar : $_ashar",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      MyFlutterApp.shalat_ashar,
                      color: Colors.blue[500],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(
                      _maghrib == null ? "Maghrib" : "Maghrib : $_maghrib",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      MyFlutterApp.shalat_maghrib,
                      color: Colors.blue[500],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(
                      _isya == null ? "Isya" : "Isya : $_isya",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      MyFlutterApp.shalat_isya,
                      color: Colors.blue[500],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return Center(child: const CircularProgressIndicator());
        }),
      ),
    );
  }
}

Widget backgroundHeader(formattedDate) {
  return Container(
    margin: const EdgeInsets.all(16),
    height: 35.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      image: DecorationImage(
        image: AssetImage("assets/images/bg.jpg"),
        fit: BoxFit.cover, //change image fill type
      ),
    ),
    child: Stack(
      children: <Widget>[
        Container(
          height: 35.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), gradient: LinearGradient(colors: [Colors.black.withOpacity(0.1), Colors.black], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(),
              Text(
                "Hari ini \n$formattedDate",
                style: TextStyle(color: Colors.yellow, fontSize: 24.sp, letterSpacing: 1.1),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
