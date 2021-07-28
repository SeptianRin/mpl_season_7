import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpl_season_7/models/match.dart';
var textOhio = TextStyle(fontFamily: 'Ohio',fontSize: 14,);

class DetailMatchScreen extends StatelessWidget{
final Match jadwal;
DetailMatchScreen(this.jadwal);

@override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 800) {
            return DetailWebPage(jadwal);
          } else {
            return DetailMobilePage(jadwal);
          }
        }
        );
  }
}

class DetailWebPage extends StatefulWidget{
  final Match jadwal;

  DetailWebPage(this.jadwal);

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text(widget.jadwal.title)),
      body: Center(
        child: Container(
          width: screenWidth <=1200? 800:1200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Column(
                    children: [
                     Expanded( flex: 4,child: Image.network(widget.jadwal.home.logo)),
                      Expanded(child: Text(widget.jadwal.home.namaTeam,style: TextStyle(fontSize: 30,fontFamily: "Ohio"),)),
                      Expanded(child: Text(widget.jadwal.homeScore,style: TextStyle(fontSize: 25,fontFamily: "Ohio"),)),
                      Expanded(child: Text("VS",style: TextStyle(fontSize: 20,fontFamily: "Ohio"),)),
                      Expanded(child: Text(widget.jadwal.awayScore,style: TextStyle(fontSize: 30,fontFamily: "Ohio"),)),
                      Expanded(child: Text(widget.jadwal.away.namaTeam,style: TextStyle(fontSize: 30,fontFamily: "Ohio"),)),
                      Expanded(flex: 4,child: Image.network(widget.jadwal.away.logo)),
                    ],
                  ),
                ),
                Column(children: [
                  Expanded(child: Image.network(widget.jadwal.home.logo)),
                  Expanded(child: Text(widget.jadwal.home.namaTeam,style: TextStyle(fontSize: 30,fontFamily: "Ohio"),)),
                  Container(
                    height: 200,
                    child: ListView(
                      shrinkWrap: true,
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      children: widget.jadwal.home.fotoPemain.asMap().entries.map((url) {
                        int idx = url.key;
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              Expanded(
                                  flex:8,
                                  child:Image.network(url.value,)
                              ),
                              Expanded(flex: 1,child: Text(widget.jadwal.home.namaPemain.elementAt(idx),style: textOhio,)),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(child: Text("VS",style: TextStyle(fontSize: 20,fontFamily: "Ohio"),)),

                  Container(
                    height: 200,
                    child: ListView(
                      shrinkWrap: true,
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      children: widget.jadwal.away.fotoPemain.asMap().entries.map((url) {
                        int idx = url.key;
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              Expanded(
                                  flex:8,
                                  child:Image.network(url.value,)
                              ),
                              Expanded(flex: 1,child: Text(widget.jadwal.away.namaPemain.elementAt(idx),style: textOhio,)),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(child: Text(widget.jadwal.away.namaTeam,style: TextStyle(fontSize: 30,fontFamily: "Ohio"),)),
                  Expanded(child: Image.network(widget.jadwal.away.logo)),
                ],),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class DetailMobilePage extends StatelessWidget {
  final Match jadwal;


  DetailMobilePage(this.jadwal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text(jadwal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
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
                          Text(jadwal.tanggalMain, textAlign: TextAlign.center,style: textOhio,),
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
            Row(
              children: [
                Expanded(flex: 1, child: Image.network(jadwal.home.logo),),
                Expanded(flex: 3, child: Text("Rooster "+jadwal.home.namaTeam,style: textOhio,)),
                Expanded(flex: 1, child: FavoriteTeamButton()),
              ],
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: jadwal.home.fotoPemain.asMap().entries.map((url) {
                  int idx = url.key;
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Expanded(
                            flex:8,
                            child:Image.network(url.value,)
                        ),
                        Expanded(flex: 1,child: Text(jadwal.home.namaPemain.elementAt(idx),style: textOhio,)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Row(
              children: [
                Expanded(flex: 1, child: Image.network(jadwal.away.logo),),
                Expanded(flex: 3, child: Text("Rooster "+jadwal.away.namaTeam, style: textOhio,),),
                Expanded(flex: 1, child: FavoriteTeamButton()),
              ],
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: jadwal.away.fotoPemain.asMap().entries.map((url) {
                  int idx = url.key;
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex:8,
                          child:Image.network(url.value,)
                        ),
                        Expanded(flex: 1,child: Text(jadwal.away.namaPemain.elementAt(idx),style: textOhio,)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class FavoriteTeamButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteTeamButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
