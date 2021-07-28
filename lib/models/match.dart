import 'package:flutter/material.dart';
import 'package:mpl_season_7/models/team.dart';

class Match {
  Team home;
  Team away;
  String homeScore;
  String awayScore;
  String title;
  String tanggalMain;
  String jamMain;

  Match(this.home, this.away, this.homeScore, this.awayScore, this.title,
      this.tanggalMain,this.jamMain);
}

var jadwalList = [
  Match(teamList.elementAt(5),teamList.elementAt(3),"1","2","Playoff Match 1","Jumat, 30 April 2021","13.00"),
  Match(teamList.elementAt(1),teamList.elementAt(0),"2","1","Playoff Match 2","Jumat, 30 April 2021","15.50"),
  Match(teamList.elementAt(2),teamList.elementAt(3),"2","1","Playoff Match 3","Jumat, 30 April 2021","18.50"),
  Match(teamList.elementAt(4),teamList.elementAt(1),"1","2","Playoff Match 4","Sabtu, 1 Mei 2021","13.00"),
  Match(teamList.elementAt(3),teamList.elementAt(4),"2","0","Lower Bracket","Sabtu, 1 Mei 2021","15.50"),
  Match(teamList.elementAt(2),teamList.elementAt(1),"1","2","Final Upper Bracket","Sabtu, 1 Mei 2021","18.50"),
  Match(teamList.elementAt(3),teamList.elementAt(2),"0","2","Final Lower Bracket","Minggu, 2 Mei 2021","13.20"),
  Match(teamList.elementAt(1),teamList.elementAt(2),"2","4","Grand Final","Minggu, 2 Mei 2021","16.40"),

];