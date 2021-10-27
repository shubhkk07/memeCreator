import 'package:flutter/material.dart';
import 'package:piceditor/home.dart';

class DraggableText extends StatefulWidget {
  const DraggableText({Key? key}) : super(key: key);

  @override
  _DraggableTextState createState() => _DraggableTextState();
}

class _DraggableTextState extends State<DraggableText> {
  Offset offset = Offset.zero;

  TextEditingController captionContr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: offset == Offset.zero
          ? MediaQuery.of(context).size.height * 0.45
          : offset.dy,
      left: offset == Offset.zero ? 0 : offset.dx,
      child: Draggable(
        onDragUpdate: (dragDetails) {
          setState(() {
            offset = Offset(offset.dx + dragDetails.delta.dx,
                offset.dy + dragDetails.delta.dy);
          });
        },
        feedback: SizedBox(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Center(
            child: TextFormField(
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: Home.fontSize,
                  fontWeight: FontWeight.bold),
              autofocus: true,
              controller: captionContr,
              maxLines: null,
              minLines: null,
              expands: true,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Write Something...',
                  hintStyle: TextStyle(
                      color: Colors.red,
                      fontSize: Home.fontSize,
                      fontWeight: FontWeight.bold),
                  fillColor: Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }
}
