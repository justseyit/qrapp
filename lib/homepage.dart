import 'package:flutter/material.dart';

import 'scan.dart';
import 'generate.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Image(
              image: AssetImage('assets/qricon.jpg'),
              fit: BoxFit.fill,
            ),
            flatButton("QR Kodu Tara", const ScanPage()),
            const SizedBox(height: 20.0,),
            flatButton("QR Kodu Oluştur", const GeneratePage()),
          ],
        ),
      ),
    );
  }

  Widget flatButton(String text, Widget widget) {
    return ElevatedButton(
      onPressed: () async {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
