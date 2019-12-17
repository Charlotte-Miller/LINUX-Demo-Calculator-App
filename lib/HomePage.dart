import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'ColorScheme.dart';

String output = "";
String expressions = "";

bool isCalculated = false;

String calculatedValue = "";
num firstNumber = 0;
num secondNumber = 0;
String operand = "";

class MyHomePage extends StatefulWidget
{
    MyHomePage({Key key, this.title}) : super(key: key);
    final String title;

    @override
    _MyHomePageState createState()
    => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
            ),
            body: new Container(

                child: new Column(children: <Widget>[

//Phạm Trung Hiếu
//                    Display answer field
                    new Container(

                            alignment: Alignment.centerRight,

//                        Modify answer's field margin
                            padding: new EdgeInsets.symmetric(
                                    vertical: 24.0,
                                    horizontal: 12.0
                            ),

//                            Modify answer's field style
                            child: new Text(output,
                                style: new TextStyle(
                                        fontSize: 80.0,
                                        fontWeight: FontWeight.bold
                                ),
                            )
                    ),

//                    Display expressions
                    new Container(

                            alignment: Alignment.centerRight,

//                        Modify calculations' field margin
                            padding: new EdgeInsets.symmetric(
                                    horizontal: 12.0
                            ),

//                            Modify calculations' field style
                            child: new Text(expressions,
                                style: new TextStyle(
                                    fontSize: 40.0,
                                ),
                            )
                    ),


//Trần Lê Hoàng
//                    Put number rows to the bottom
                    new Expanded(
                        child: new Divider(),
                    ),

//                    Build number rows
                    buildRowOf4('AC', '+/-', '%', '/'),
                    buildRowOf4('7', '8', '9', '*'),
                    buildRowOf4('4', '5', '6', '/'),
                    buildRowOf4('1', '2', '3', '+'),
                    buildRowOf4('000', '0', '.', '='),

                ],),
            ),
        );
    }

    Row buildRowOf4(String first, second, thrid, fourth)
    {
        return new Row(
                children: [
                    buildButton(first),
                    buildButton(second),
                    buildButton(thrid),
                    buildButton(fourth)
                ]
        );
    }

    Widget buildButton(String buttonNumber)
    {
        return new Expanded(
            child: new MaterialButton(
                    child: new Text(
                        buttonNumber,

                        style: new TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(6, 63, 33, 100.0)
                        ),
                    ),

                    onPressed: ()
                    => handleButtonPressed(buttonNumber),

                    color: YELLOW_GREEN,
                    textColor: UP_FOREST_GREEN,
                    height: 70
            ),
        );
    }

//    Nguyễn Việt Hoàng
    handleButtonPressed(String buttonText)
    {
        if (buttonText == "AC")
        {
            reset();
        }
        else if (buttonText == "+"
                || buttonText == "-")
        {
            operand = buttonText;
            firstNumber = num.parse(calculatedValue);
            calculatedValue = "";
            expressions += " ${operand} ";
        }
        else if (buttonText == "*"
                || buttonText == "/")
        {
            operand = buttonText;
            firstNumber = num.parse(output);
            calculatedValue = "";

            if (expressions.contains("+") || expressions.contains("-"))
            {
                expressions = "(${expressions}) ${operand} ";
            }
            else
            {
                expressions += " ${operand} ";
            }
        }
        else if (buttonText == ".")
        {
            if (calculatedValue.contains("."))
            {
                print("You already pressed the dot button");
                return;
            }
            else
            {
                calculatedValue += buttonText;
                expressions += buttonText;
            }
        }
        else if (buttonText == "=" && !isCalculated)
        {
            isCalculated = true; //to block spamming press "=" button that leads to misleading output display

            secondNumber = num.parse(calculatedValue);

            switch (operand)
            {
                case "+":
                    calculatedValue = (firstNumber + secondNumber).toString();
                    break;

                case "-":
                    calculatedValue = (firstNumber - secondNumber).toString();
                    break;

                case "*":
                    calculatedValue = (firstNumber * secondNumber).toString();
                    break;

                case "/":
                    calculatedValue = (firstNumber / secondNumber).toString();
                    break;
            }
        }
        else //when press in number buttons
        {
            calculatedValue += buttonText;
            expressions += buttonText;
        }

        print(calculatedValue);

        setState(()
        {
            if (calculatedValue == "")
            {
                output = calculatedValue;
            }
            else
            {
                num finalOutput = num.parse(calculatedValue);
                var formatter = new NumberFormat();

                if (finalOutput is int) //Check if output is an integer
                {
                    output = formatter.format(finalOutput);
                }
                else
                {
                    num roundedOutput = num.parse(finalOutput
                            .toStringAsFixed(2)); //round the output to 2 digits after decimal point
                    output = formatter.format(roundedOutput);
                }
            }
        });
    }

    void reset()
    {
        expressions = "";
        output = "";
        calculatedValue = "";
        firstNumber = 0.0;
        secondNumber = 0.0;
        operand = "";
        isCalculated = false;
    }
}