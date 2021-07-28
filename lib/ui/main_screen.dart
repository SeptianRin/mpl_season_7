import 'package:flutter/material.dart';
import 'package:mpl_season_7/models/match.dart';
import 'package:mpl_season_7/ui/detailmatch_screen.dart';

var textOhio = TextStyle(fontFamily: 'Ohio');

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("MPL Season 7"),titleTextStyle: textOhio,),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text("Playoff Season 7",textAlign: TextAlign.center,style: TextStyle(fontSize: 30, fontFamily: "Ohio",),),
              Expanded(child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth <= 600) {
                return ListJadwalMobile();
                } else if (constraints.maxWidth <= 1200) {
                return ListJadwalWeb(3);
                } else {
                return ListJadwalWeb(5);
                }
                }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListJadwalWeb extends StatelessWidget{
  final int gridCount;


  ListJadwalWeb(this.gridCount);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: jadwalList.map((jadwal) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailMatchScreen(jadwal);
                }));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Image.network(
                            jadwal.home.logo,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Image.network(
                            jadwal.away.logo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        jadwal.home.namaTeam+ " VS "+jadwal.away.namaTeam,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Ohio"
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(
                        jadwal.tanggalMain+" "+jadwal.jamMain,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Ohio"
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                            child: Text(
                              jadwal.homeScore ,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                  fontFamily: "Ohio"
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                            child: Text(
                              "-" ,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Ohio"
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                            child: Text(
                              jadwal.awayScore ,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Ohio"
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ListJadwalMobile extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context,index) {
      final Match jadwal = jadwalList[index];
      return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailMatchScreen(jadwal);
          }));
        },
        child: Card(
          shadowColor: Colors.black,
          shape: StadiumBorder(
              side: BorderSide(
                  color: Colors.black,
                  width: 2.0
              )
          ),
          color: Colors.red[900],
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded( flex:2,child: Image.network(jadwal.home.logo)),
                Expanded(flex:1,child: Text(jadwal.homeScore, textAlign: TextAlign.center,style: textOhio,)),
                Expanded(
                  flex:3,
                  child: Column(
                    children: [
                      Text(jadwal.tanggalMain, textAlign: TextAlign.center, style: textOhio,),
                      Text(jadwal.jamMain, textAlign: TextAlign.center,style: textOhio,),
                      Text("VS", textAlign: TextAlign.center,style: textOhio,),
                      Text(jadwal.title, textAlign: TextAlign.center,style: textOhio,),
                    ],
                  ),
                ),
                Expanded(flex:1,child:Text(jadwal.awayScore, textAlign: TextAlign.center,style: textOhio,)),
                Expanded(flex:2,child: Image.network(jadwal.away.logo)),
              ],
            ),
          ),
        ),
      );
    },
    itemCount: jadwalList.length,
    );
  }
}