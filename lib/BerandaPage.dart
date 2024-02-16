import 'package:coba_tampilan/HomePage.dart';
import 'package:coba_tampilan/ProdukPage.dart';
import 'package:coba_tampilan/ProdukPageBaru.dart';
import 'package:coba_tampilan/ProfilPageBaru.dart';
import 'package:coba_tampilan/SettingPage.dart';
import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Aplikasi Saya"),
              bottom: TabBar(
                indicatorColor:Colors.blue,
                labelColor: Colors.blue,
                tabs: <Widget>[
                Tab(
                  icon: (Icon(Icons.account_balance)),
                ),
                Tab(
                  icon: (Icon(Icons.shop)),
                ),
                Tab(
                  icon: (Icon(Icons.person)),
                ),
                Tab(
                  icon: (Icon(Icons.settings)),
                ),
              ]),
            ),
            body: TabBarView(children: <Widget> [
              HomePage(),
              ProdukPageBaru(),
              ProfilPageBaru(),
              SettingPage()
            ]),
          )
          ),
    );
  }
}
