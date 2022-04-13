import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tugas/service/image_picker_helper.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  String file = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Camera Access",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: [
            _imageSection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buttonGallery(),
                _buttonCamera(),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              " PROFIL MAHASISWA : ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Text(" Rafi Khairuna Wibisono "),
            Text(" NIM : 123190091 "),
            Text(" Yogyakarta "),
            SizedBox(
              height: 16,
            ),
            Text(" Praktikum Teknologi dan Pemrograman Web "),
            Text(" IF-A "),
          ],
        ),
      ),
    );
  }

  Widget _imageSection() {
    if (file.isEmpty) {
      return Image.network(
        "https://static.thenounproject.com/png/396915-200.png",
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.5,
      );
    } else {
      return Image.file(
        File(file),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.5,
      );
    }
  }

  void _processImage(String? filePath) {
    if (filePath != null) {
      setState(() {
        file = filePath;
      });
    }
    ;
  }

  Widget _buttonGallery() {
    return ElevatedButton(
      // style: ElevatedButton.styleFrom(
      //   primary: Colors.purple,
      // ),
      onPressed: () {
        ImagePickerHelper().imagePickerFromGallery((filePath) {
          _processImage(filePath);
        });
      },
      child: Text(
        "From Gallery",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buttonCamera() {
    return ElevatedButton(
      onPressed: () {
        ImagePickerHelper()
            .imagePickerFromCamera((filePath) => _processImage(filePath));
      },
      child: Text(
        "From Camera",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
