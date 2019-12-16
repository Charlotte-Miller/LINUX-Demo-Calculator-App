import 'package:flutter/material.dart';

//Phạm Khánh Nam

//Build custom colors base on this site: https://coolors.co/063f21-8ab62d-708e30-d1d44a-698a32
const Map<int, Color> CUSTOM_COLOR =
{
    50: Color.fromRGBO(105, 138, 50, .1),
    100: Color.fromRGBO(105, 138, 50, .2),
    200: Color.fromRGBO(105, 138, 50, .3),
    300: Color.fromRGBO(105, 138, 50, .4),
    400: Color.fromRGBO(105, 138, 50, .5),
    500: Color.fromRGBO(105, 138, 50, .6),
    600: Color.fromRGBO(105, 138, 50, .7),
    700: Color.fromRGBO(105, 138, 50, .8),
    800: Color.fromRGBO(105, 138, 50, .9),
    900: Color.fromRGBO(105, 138, 50, 1),
};

const MaterialColor MAXIMUM_GREEN = MaterialColor(0xFF698A32, CUSTOM_COLOR);
const MaterialColor MAXIMUM_GREEN_YELLOW = MaterialColor(0xFFD1D44A, CUSTOM_COLOR);
const MaterialColor OLIVE_DRAB = MaterialColor(0xFF708E30, CUSTOM_COLOR);
const MaterialColor YELLOW_GREEN = MaterialColor(0xFF8AB62D, CUSTOM_COLOR);
const MaterialColor UP_FOREST_GREEN = MaterialColor(0xFF063F21, CUSTOM_COLOR);

void main()
=> runApp(MyApp());

class MyApp extends StatelessWidget
{
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context)
    {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: MAXIMUM_GREEN, //Theme Color
            ),
            home: MyHomePage(title: 'Green Family Calculator'),
        );
    }
}

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
    String output = "";
    String calculations = "";

    String calculatedValue = "0";
    num firstNumber = 0;
    num secondNumber = 0;
    String operand = "";

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
//                    Showing answer field
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
                || buttonText == "-"
                || buttonText == "*"
                || buttonText == "/")
        {
            operand = buttonText;
            firstNumber = num.parse(output);
            calculatedValue = "0";
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
            }
        }
        else if (buttonText == "=")
        {
            secondNumber = num.parse(output);

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
//            reset();
        }
        else //when press in number buttons
        {
            calculatedValue += buttonText;
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
//                int temp = int.parse(calculatedValue);

                if (finalOutput is int) //Check if output is an integer
                {
                    output = finalOutput.toStringAsFixed(0);
                }
                else
                {
                    num roundedOutput = num.parse(finalOutput
                            .toStringAsFixed(2)); //round the output to 2 digits after decimal point
                    output = roundedOutput.toString();
                }
            }
        });
    }

    void reset()
    {
        output = "";
        calculatedValue = "";
        firstNumber = 0.0;
        secondNumber = 0.0;
        operand = "";
    }
}