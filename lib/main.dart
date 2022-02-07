import 'package:flutter/material.dart';

void main(){
  runApp(Calculator());
}
class Calculator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomepage(),
    );
  }
}
class MyHomepage extends StatefulWidget {
  // const MyHomepage({Key? key}) : super(key: key);

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  
  int firstnum = 0;
  int secondnum = 0;
  String textdisplay = "";
  String res = '';
  String operation = "";
  String history="";

  void btnclicked(String btnvalue) {
    if (btnvalue == "C") {
      textdisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
      history="";
    }
    else if (btnvalue == "+" || btnvalue == "-" || btnvalue == "X" ||
        btnvalue == "/") {
      firstnum = int.parse(textdisplay);
      res = "";
      operation = btnvalue;
    }
    else if (btnvalue == "=") {
      secondnum = int.parse(textdisplay);
      if (operation == "+") {
        res = (firstnum + secondnum).toString();
        history=firstnum.toString() + operation.toString() +secondnum.toString();
      }
      if (operation == "-") {
        res = (firstnum - secondnum).toString();
        history=firstnum.toString() + operation.toString() +secondnum.toString();
      }
      if (operation == "X") {
        res = (firstnum * secondnum).toString();
        history=firstnum.toString() + operation.toString() +secondnum.toString();
      }
      if (operation == "/") {
        res = (firstnum / secondnum).toString();
        history=firstnum.toString() + operation.toString() +secondnum.toString();
      }
    }
    else {
      res = int.parse(textdisplay + btnvalue).toString();
    }
    setState(() {
      textdisplay = res;
    });
  }

   custombutton(String btnvalue) {
    return Expanded(
      child: Padding(
         padding:EdgeInsets.all(5.0),
        child: SizedBox(height: 60,width: 90,
          child: ElevatedButton(
              onPressed: () => btnclicked(btnvalue),
              child: Text("$btnvalue",
                style: const TextStyle(fontSize: 25.0),),
            ),
        ),
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Card(
        elevation: 10,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
              padding: const EdgeInsets.only(right: 12,),
                alignment: Alignment.bottomRight,
                child: Text(history, style: const TextStyle(
                    fontSize: 25.0,),),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                alignment: Alignment.bottomRight,
                child: Text(textdisplay, style: const TextStyle(
                    fontSize: 48.0, fontWeight: FontWeight.w800),),
              ),
              Row(
                children: <Widget>[
                  custombutton("9"),
                  custombutton("8"),
                  custombutton("7"),
                  custombutton("+"),
                ],
              ),
              Row(
                children: <Widget>[
                  custombutton("6"),
                  custombutton("5"),
                  custombutton("4"),
                  custombutton("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  custombutton("3"),
                  custombutton("2"),
                  custombutton("1"),
                  custombutton("X"),
                ],
              ),
              Row(
                children: <Widget>[
                  custombutton("C"),
                  custombutton("0"),
                  custombutton("="),
                  custombutton("/"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


