import 'package:flutter/cupertino.dart';

import './ExpressionEvaluation/math_expressions.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'ColorScheme.dart';

String output = "";
String expression = "";

bool isCalculated = false;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
//Phạm Trung Hiếu
//                    Display answer field
            new Container(
                alignment: Alignment.centerRight,

//                        Modify answer's field margin
                padding:
                    new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),

//                            Modify answer's field style
                child: new Text(
                  output,
                  style: new TextStyle(
                      fontSize: 80.0, fontWeight: FontWeight.bold),
                )),

//                    Display expressions
            new Container(
                alignment: Alignment.centerRight,

//                        Modify calculations' field margin
                padding: new EdgeInsets.symmetric(horizontal: 12.0),

//                            Modify calculations' field style
                child: new Text(
                  expression,
                  style: new TextStyle(
                    fontSize: 40.0,
                  ),
                )),

//Trần Lê Hoàng
//                    Put number rows to the bottom
            new Expanded(
              child: new Divider(),
            ),

//                    Build button rows
            buildFirstRow(),
            buildRowOf4('7', '8', '9', '*'),
            buildRowOf4('4', '5', '6', '-'),
            buildRowOf4('1', '2', '3', '+'),
            buildRowOf4('000', '0', '.', '='),
          ],
        ),
      ),
    );
  }

//    Special row for AC button and some operator buttons
  Row buildFirstRow() {
    return new Row(children: [
      buildButton('AC', backgroundColor: RUBY_RED),
      buildButton('(', backgroundColor: DARK_IMPERIAL_BLUE),
      buildButton(')', backgroundColor: DARK_IMPERIAL_BLUE),
      buildButton('/', backgroundColor: DARK_IMPERIAL_BLUE)
    ]);
  }

  Row buildRowOf4(String first, second, third, fourth) {
    return new Row(children: [
      buildButton(first),
      buildButton(second),
      buildButton(third),
      buildButton(fourth, backgroundColor: DARK_IMPERIAL_BLUE)
    ]);
  }

  Widget buildButton(String buttonNumber,
      {MaterialColor backgroundColor = MAASTRICHT_BLUE,
      MaterialColor textColor = BABY_POWDER}) {
    return new Expanded(
      child: new MaterialButton(
        child: new Text(
          buttonNumber,
          style: new TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => handleButtonPressed(buttonNumber),
        color: backgroundColor,
        textColor: textColor,
        height: 100,
      ),
    );
  }

//    Nguyễn Việt Hoàng
  handleButtonPressed(String buttonText) {
    // Replace the precious expression with the previous result when move to the next calculation
    if (isCalculated)
    {
      if (buttonText.contains(new RegExp(r'[\+\-\*\/]')))
      {
        expression = output;
        isCalculated = false;
      }
      else
      {
        reset();
      }
    }

    if (buttonText == 'AC') 
    {
      reset();
    } 
    else if (buttonText != '=') 
    {
      expression += " $buttonText";
    } 
    else if (buttonText == '=') 
    {
      isCalculated = true;

      double result = getResultBaseOnExpression(expression);
      output = getFormattedContent(result);
    }

    setDisplayState(output);
  }

  void reset() {
    expression = "";
    output = "";
    isCalculated = false;
  }

  double getResultBaseOnExpression(String expression) {
    Parser p = new Parser();
    Expression exp = p.parse(expression);

    ContextModel cm = new ContextModel();

    return exp.evaluate(EvaluationType.REAL, cm);
  }

  String getFormattedContent(content) {
    content = content.toString();

    if (content == "") {
      return content;
    } else {
      num finalOutput = num.tryParse(content);
      var formatter = new NumberFormat();

      if (finalOutput is int) //Check if output is an integer
      {
        return formatter.format(finalOutput);
      } else {
        num roundedOutput = num.tryParse(finalOutput.toStringAsFixed(
            3)); //round the output to 2 digits after decimal point
        return formatter.format(roundedOutput);
      }
    }
  }

  void setDisplayState(String content) {
    setState(() {
      output = content;
    });
  }
}
