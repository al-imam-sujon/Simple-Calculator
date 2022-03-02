import 'package:calculator/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int firstnum;
  late int secondnum;
  String storeD = '';
  String display = '';
  late String result;
  late String operator;

  void button(String btnCal) {
    print(btnCal);
    if (btnCal == 'C') {
      display = '';
      firstnum = 0;
      secondnum = 0;
      result = '';
    } else if (btnCal == 'AC') {
      display = '';
      firstnum = 0;
      secondnum = 0;
      storeD = '';
      result = '';
    } else if (btnCal == '+' ||
        btnCal == '-' ||
        btnCal == 'X' ||
        btnCal == '/') {
      
      firstnum=int.parse(display);
      result='';
      operator=btnCal;
    }
    else if(btnCal=='+/-'){
      if(display[0]!='-'){
        result='-'+display;
      }
      else{
        result=display.substring(1);
      }
    }
    else if(btnCal=='<'){
      result=display.substring(0,display.length-1);
    }
    else if(btnCal=='='){
      secondnum=int.parse(display);

      if(operator=='+'){
        result=(firstnum + secondnum).toString();
        storeD=firstnum.toString()+operator.toString()+secondnum.toString();
      }
      if(operator=='-'){
        result=(firstnum - secondnum).toString();
        storeD=firstnum.toString()+operator.toString()+secondnum.toString();
      }
      if(operator=='X'){
        result=(firstnum * secondnum).toString();
        storeD=firstnum.toString()+operator.toString()+secondnum.toString();
      }
      if(operator=='/'){
        result=(firstnum / secondnum).toString();
        storeD=firstnum.toString()+operator.toString()+secondnum.toString();
      }
    }
    else{
      result=int.parse(display+btnCal).toString();
    }
    setState(() {
      display=result;
    });


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        backgroundColor: Color(0xffd99b9b),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    storeD,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),

              SizedBox(height: 25,),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    display,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalCulatorApp('AC', 25, button),
                  CalCulatorApp('C', 30,button),
                  CalCulatorApp('<', 30,button),
                  CalCulatorApp('/', 30,button),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalCulatorApp('7', 30,button),
                  CalCulatorApp('8', 30,button),
                  CalCulatorApp('9', 30,button),
                  CalCulatorApp('X', 30,button),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalCulatorApp('4', 30,button),
                  CalCulatorApp('5', 30,button),
                  CalCulatorApp('6', 30,button),
                  CalCulatorApp('-', 30,button),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalCulatorApp('1', 30,button),
                  CalCulatorApp('2', 30,button),
                  CalCulatorApp('3', 30,button),
                  CalCulatorApp('+', 30,button),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalCulatorApp('+/-', 30,button),
                  CalCulatorApp('0', 30,button),
                  CalCulatorApp('00', 30,button),
                  CalCulatorApp('=', 30,button),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Widget button(){
//   List<String> btText=["AC","C","<","/"];
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//     children: [
//
//       CalCulatorApp(btText[0],20),
//       CalCulatorApp(btText[1],20),
//       CalCulatorApp(btText[2],20),
//       CalCulatorApp(btText[3],20),
//
//
//     ],
//   );
//
// }
