import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_app/model/arabModel.dart';
import 'package:sizer/sizer.dart';

class MukhtarulHadist extends StatefulWidget {
  const MukhtarulHadist({Key? key}) : super(key: key);

  @override
  State<MukhtarulHadist> createState() => _MukhtarulHadistState();
}


class _MukhtarulHadistState extends State<MukhtarulHadist> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(     
      body: Container(
        color: Color.fromARGB(255, 233, 233, 233),
        width: double.infinity,
        height: double.infinity,
        child: NestedScrollView(  
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
          SliverAppBar(
            floating: true,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/bg.jpg",
                fit: BoxFit.cover,
              ),
              title: Text('Terjemahan Mukhtarul Ahadist',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.center),
            ),
            expandedHeight: 25.h,
          ),
          ];
        },  
        body: FutureBuilder(
              future: ReadJsonData(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(child: Text("${data.error}"));
                } else if (data.hasData) {
                  var items = data.data as List<ArabDataModel>;
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        return CustomListItem(
                            arab: items[index].value.toString(),
                            indonesia: items[index].valueIndonesia.toString(),
                            jawa: items[index].valueJawa.toString(),
                            ayat: Center(
                                    child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(items[index].id.toString(), style: TextStyle(fontSize: 14.0),),
                                      ),
                                    ),
                                  ))
                        ); 
                      }
                    );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ),
        ),
  );
              
  } 

  Future<List<ArabDataModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfile/arab.json');
    final jsondata2 =
        await rootBundle.rootBundle.loadString('jsonfile/indonesia.json');
    final jsondata3 =
        await rootBundle.rootBundle.loadString('jsonfile/jawa.json');    
    final list = json.decode(jsondata) as List<dynamic>;
    final list2 = json.decode(jsondata2) as List<dynamic>; 
    final list3 = json.decode(jsondata3) as List<dynamic>; 

    for(int i = 0; i < 488; i++){
        list[i].addAll(list2[i]);
        list[i].addAll(list3[i]);
    }      
    return list.map((e) => ArabDataModel.fromJson(e)).toList();   
  }

}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    super.key,
    required this.ayat,
    required this.arab,
    required this.indonesia,
    required this.jawa,
  });

  final Widget ayat;
  final String arab;
  final String indonesia;
  final String jawa;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: _Hadist(
              arab: arab,
              indonesia: indonesia,
              jawa: jawa,
            ),
          ),
          Container(
            child: ayat,
          ),
        ],
      ),
    );
  }
}

class _Hadist extends StatelessWidget {
  const _Hadist({
    required this.arab,
    required this.indonesia,
    required this.jawa,
  });

  final String arab;
  final String indonesia;
  final String jawa;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            arab,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
            textAlign: TextAlign.right,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
                              Text(
                                "Terjemahan Indonesia :",
                                style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                indonesia,
                                style: const TextStyle(fontSize: 10.0),
                                textAlign: TextAlign.justify,
                              ),
                            ]
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
                              Text(
                                "Terjemahan Jawa :",
                                style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                jawa,
                                style: const TextStyle(fontSize: 10.0),
                                textAlign: TextAlign.justify,
                              ),
                            ]
          ),
          Container(height: 16.0),
        ],
      ),
    );
  }
}
