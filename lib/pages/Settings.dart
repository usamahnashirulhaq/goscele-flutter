import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengaturan"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Informasi Pengguna",
                      style: TextStyle(fontSize: 23),
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Nama Lengkap",
                            style: TextStyle(fontSize: 16),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        ),
                        Text("Someone"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Nama Pengguna",
                            style: TextStyle(fontSize: 16),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        ),
                        Text("Someone"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            ),
            Card(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Akun",
                      style: TextStyle(fontSize: 23),
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Keluar",
                            style: TextStyle(fontSize: 16),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        ),
                        Text("Hapus data aplikasi dan keluar"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            ),
            Card(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Tentang Aplikasi",
                      style: TextStyle(fontSize: 23),
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Nama Aplikasi",
                            style: TextStyle(fontSize: 16),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        ),
                        Text("-"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Versi Aplikasi",
                            style: TextStyle(fontSize: 16),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        ),
                        Text("-"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Kanal Pengembangan",
                            style: TextStyle(fontSize: 16),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        ),
                        Text("Keep update with us"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Repositori Github",
                            style: TextStyle(fontSize: 16),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        ),
                        Text("-"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Lisensi",
                            style: TextStyle(fontSize: 16),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        ),
                        Text("MIT"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }
}
