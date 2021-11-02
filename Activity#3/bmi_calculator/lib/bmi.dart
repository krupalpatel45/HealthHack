import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  void calculateBMI() {

    // if getstatus is true then calculate the bmi using the formula
    if (getStatus()) {
      double weightInlbs = double.parse(_weightController.text);

      double heightConvertedInches =
          double.parse(_chosenValueFeet); //height converted from feet to inch

      double heightInches =
          double.parse(_chosenValueInches); //height converted from feet to inch

      double _convertedHeight = (heightConvertedInches * 12) + heightInches;

      double _heightsquared = (_convertedHeight * _convertedHeight);

      _result = (weightInlbs * 703) / (_heightsquared);
    } else {
      _result = -1;
    }

    // This section will check for the error statements
    setState(() {
      if (_result > 0 && _result < 18.5) {
        _message = "Underweight";
      } else if (_result > 18.5 && _result < 25) {
        _message = "Healthy Weight Range";
      } else if (_result > 25 && _result < 30) {
        _message = "Over Weight";
      } else if (_result > 30 && _result < 1000) {
        _message = "Severely Weight";
      } else {
        String errorMessage = "Please enter ";
        if (_chosenValueFeet == null) {
          errorMessage = errorMessage + "Feet ";
        }
        if (_chosenValueInches == null) {
          errorMessage = errorMessage + "Inches ";
        }
        if (_weightController.text == "") {
          errorMessage = errorMessage + "Weight ";
        }
        _message = errorMessage;
      }
    });
  }

  bool getStatus() {    // function to check if any of the values is false

    if (_chosenValueFeet == null) {
      return false;
    }
    if (_chosenValueInches == null) {
      return false;
    }
    if (_weightController.text == null) {
      return false;
    }
    return true;
  }

  String _chosenValueFeet;
  String _chosenValueInches;
  double _result;
  String _message = "";
  String _errors = "";

  final TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HealthHack'),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: DropdownButton<String>(
                          //Dropdown button for Feet
                          value: _chosenValueFeet,
                          style: TextStyle(color: Colors.black),

                          items: <String>[
                            '3',
                            '4',
                            '5',
                            '6',
                            '7',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text(
                              "Feet                                                 "),

                          onChanged: (String value) {
                            setState(() {
                              _chosenValueFeet = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        child: DropdownButton<String>(
                          //Dropdown button for inches
                          value: _chosenValueInches,
                          style: TextStyle(color: Colors.black),

                          items: <String>[
                            '0',
                            '1',
                            '2',
                            '3',
                            '4',
                            '5',
                            '6',
                            '7',
                            '8',
                            '9',
                            '10',
                            '11',
                          ].map<DropdownMenuItem<String>>((String value2) {
                            return DropdownMenuItem<String>(
                              value: value2,
                              child: Text(value2),
                            );
                          }).toList(),
                          hint: Text(
                              "Inches                                                 "),

                          onChanged: (String value2) {
                            setState(() {
                              _chosenValueInches = value2;
                            });
                          },
                        ),
                      )
                    ] //ending of row widget
                    ),
                SizedBox(height: 50),
                TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: ' Weight in lbs',
                  ),
                ),
                SizedBox(height: 50),
                OutlinedButton(     //Calculate button to initialize the calculateBMI funtion
                    child: Text(
                      "Calculate",
                    ),
                    onPressed: () {
                      calculateBMI();
                    }),
                SizedBox(height: 50),
                Text('Result'),
                SizedBox(height: 40),
                Text(
                  _result == null || _result == -1
                      ? " "
                      : "${_result.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  child: Text(
                    _result == null ? "Enter Feet " : "$_message",
                    style: TextStyle(
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ])),
    );
  }
}
