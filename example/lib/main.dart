import 'dart:convert';
import 'dart:html';
import 'dart:html';
import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compressorjs/flutter_compressorjs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _imageNotifier = ValueNotifier<Uint8List?>(null);
  String comparisonSize = "";

  onButtonPressed() async {
    final XFile? xfile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (xfile != null) {
      final initialSize = await xfile.length();

      FlutterCompressorJS(
          File([await xfile.readAsBytes()], xfile.name,
              {'type': xfile.mimeType}),
          Options(
            maxWidth: 2048,
            quality: 0.7,
            success: allowInterop((blob) {
              if (blob != null) {
                var r = FileReader();
                r.readAsArrayBuffer(blob);

                r.onLoadEnd.listen((data) {
                  _imageNotifier.value = r.result as Uint8List;

                  final finalSize = (_imageNotifier.value!).length;

                  var f = NumberFormat("####.0#", "en_US");

                  comparisonSize =
                      'initial size is $initialSize and final size is $finalSize. Compression of ${f.format(initialSize / finalSize)}x';
                });
              }
            }),
          ));
    }

    // if (image != null) {
    //   //TestClass(await image.readAsBytes(), image.name);

    //   TestTwo(File([await image.readAsBytes()], image.name,
    //       {'type': image.mimeType}));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: onButtonPressed,
                child: const Text('pick image'),
              ),
              ValueListenableBuilder<Uint8List?>(
                  valueListenable: _imageNotifier,
                  builder: (context, value, child) {
                    if (value != null) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(comparisonSize),
                            Image.memory(value),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
