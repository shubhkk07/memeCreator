import 'package:flutter/material.dart';
import 'package:piceditor/home.dart';

class FontSlider extends StatefulWidget {
  Function? refreshState;
  FontSlider({Key? key, this.refreshState}) : super(key: key);

  @override
  _FontSliderState createState() => _FontSliderState();
}

class _FontSliderState extends State<FontSlider> {
  double val = 30.0;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.05,
      left: MediaQuery.of(context).size.width * 0.15,
      child: Material(
        elevation: 5,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: Slider(
              min: 25,
              max: 80,
              value: Home.fontSize,
              onChanged: (newVal) {
                setState(() {
                  Home.fontSize = newVal;
                });
                widget.refreshState!();
              }),
        ),
      ),
    );
  }
}
