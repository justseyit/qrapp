import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratePage extends StatefulWidget {
  const GeneratePage({Key? key}) : super(key: key);

  @override
  State<GeneratePage> createState() => GeneratePageState();
}

class GeneratePageState extends State<GeneratePage> {
  String qrData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Kodu Oluştur'),
        actions: const <Widget>[],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              QrImage(
                data: qrData,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Yeni QR Oluştur",
                style: TextStyle(fontSize: 20.0),
              ),
              TextField(
                controller: qrDataField,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: "Veri ya da bağlantı girin.",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    if (qrDataField.text.isEmpty) {
                      setState(() {
                        qrData = "";
                      });
                    } else {
                      setState(() {
                        qrData = qrDataField.text;
                      });
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "QR Oluştur",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final qrDataField = TextEditingController();
}
