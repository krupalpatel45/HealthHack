import 'package:flutter/material.dart';
import 'bmi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMI(),
    );
  }
}

/*

String _value1;
  String _value2;

  final List<String> nameList = <String>[
    "Name1",
    "Name2",
    "Name3",
    "Name4",
    "Name5",
    "Name6",
    "Name7",
    "Name8"
  ];

  /// initialization is here:
  @override
 void initState() {
    super.initState();
    _value1 = nameList[0];
    _value2 = nameList[3];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text('Name: '),
            Center(
              child: DropdownButton(
                value: _value1,
                onChanged: (value) {
                  setState(() {
                    _value1 = value;
                  });
                },
                items: nameList.map(
                  (item) {
                    return DropdownMenuItem(
                      value: item,
                      child: new Text(item),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text('Name: '),
            Center(
              child: DropdownButton(
                value: _value2,
                onChanged: (value) {
                  setState(() {
                    _value2 = value;
                  });
                },
                items: nameList.map(
                  (item) {
                    return DropdownMenuItem(
                      value: item,
                      child: new Text(item),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
*/

