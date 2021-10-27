import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:piceditor/draggableText.dart';
import 'package:piceditor/fontSlider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static double fontSize = 30.0;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _file;
  bool caption = false;
  bool done = false;
  bool slider = false;
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _file != null
          ? FloatingActionButton(
              onPressed: () {
                if (!caption) {
                  setState(() {
                    caption = true;
                    done = true;
                  });
                } else {
                  FocusScope.of(context).unfocus();
                }
              },
              child: Icon(Icons.edit),
            )
          : null,
      appBar: AppBar(
        actions: _file != null
            ? [
                caption
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            slider = false;
                          });
                          FocusScope.of(context).unfocus();
                        },
                        icon: Icon(
                          Icons.done,
                          color: Colors.black,
                        ))
                    : SizedBox(),
                IconButton(
                    onPressed: () async {
                      if (!slider) {
                        setState(() {
                          slider = true;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.text_fields,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _file = null;
                        slider = false;
                        caption = false;
                        done = false;
                      });
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                    )),
              ]
            : null,
        title: Text(
          'Pic Editor',
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: _file == null
          ? Center(
              child: ElevatedButton(
                child: Text('Pick an Image'),
                onPressed: () async {
                  final file = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (file != null) {
                    setState(() {
                      _file = File(file.path);
                    });
                  }
                },
              ),
            )
          : Stack(children: [
              Container(
                  color: Colors.black,
                  child: Center(
                    child: Image(
                      image: FileImage(_file!),
                    ),
                  )),
              caption ? DraggableText() : SizedBox(),
              slider
                  ? FontSlider(
                      refreshState: () {
                        setState(() {});
                      },
                    )
                  : SizedBox(),
            ]),
    );
  }
}
