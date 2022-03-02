import 'package:flutter/material.dart';

class CalCulatorApp extends StatelessWidget {

  final String text;
  final double textSize;
  final Function callback;

  CalCulatorApp(this.text,this.textSize,this.callback);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: MediaQuery.of(context).size.height/10,
        width: MediaQuery.of(context).size.width/5,
        child: ElevatedButton(
          child: Text(text,style: TextStyle(fontSize: textSize,fontWeight: FontWeight.bold),),
          onPressed: ()=>callback(text),

        ),
      ),
    );
  }
}
