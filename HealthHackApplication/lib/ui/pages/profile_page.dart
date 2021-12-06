import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthhack/utils/utils.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _currentWeightController;
  late TextEditingController _goalWeightController;
  late TextEditingController _bmiController;

  String? _chosenValueFeet;
  String? _chosenValueInches;

  var isProfileEdit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController(text: Utils.getName);
    _emailController = TextEditingController(text: Utils.getEmail);
    _currentWeightController =
        TextEditingController(text: '${Utils.getCurrentWeight}');
    _goalWeightController =
        TextEditingController(text: '${Utils.getGoalWeight}');
    _bmiController = TextEditingController(text: '${Utils.getBMI}');

    final feet = Utils.getHeightFeet;
    if(feet != 0) {
      _chosenValueFeet = '$feet ft';
    }
    final inch = Utils.getHeightInches;

    if(inch != 0) {
      _chosenValueInches = '$inch in';
    }
  }


  void saveAction() {

    final name = _nameController.text;
    final email = _emailController.text;
    final currentWeight = _currentWeightController.text;
    final goalWeight = _goalWeightController.text;

    if(name.trim() == '') {
      Get.defaultDialog(
        title: 'Alert',
        middleText: 'Please enter your name',
        onConfirm: () {
          Get.back();
        }
      );
      return;
    }

    if(!email.isValidEmail()) {
      Get.defaultDialog(
          title: 'Alert',
          middleText: 'Please enter valid email',
          onConfirm: () {
            Get.back();
          }
      );
      return;
    }


    Utils.setName(name);
    Utils.setEmail(email);

    if(currentWeight.trim() != ''){
      final weight = int.parse(currentWeight);
      Utils.setCurrentWeight(weight);
    }

    if(goalWeight.trim() != ''){
      final weight = int.parse(goalWeight);
      Utils.setGoalWeight(weight);
    }

    final feetValue = _chosenValueFeet;
    if(feetValue != null) {
      final feet = feetValue.replaceAll(' ft', '');
      Utils.setHeightFeet(int.parse(feet));
    }

    final inchValue = _chosenValueInches;
    if(inchValue != null) {
      final inch = inchValue.replaceAll(' in', '');
      Utils.setHeightInches(int.parse(inch));
    }
    setState(() {
      this.isProfileEdit = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            this.isProfileEdit ? Container() :
            Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    this.isProfileEdit = true;
                  });
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    child: ClipOval(
                      child: Image.asset('assets/user.jpg'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextField(
                        enabled: this.isProfileEdit,
                        enableInteractiveSelection: this.isProfileEdit,
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                      TextField(
                        enabled: this.isProfileEdit,
                        enableInteractiveSelection: this.isProfileEdit,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      TextField(
                        enabled: this.isProfileEdit,
                        enableInteractiveSelection: this.isProfileEdit,
                        controller: _currentWeightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Current Weight in lbs',
                        ),
                      ),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('Height'),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  //Dropdown button for Feet
                                  value: _chosenValueFeet,
                                  style: TextStyle(color: Colors.black),
                                  items: <String>[
                                    '3 ft',
                                    '4 ft',
                                    '5 ft',
                                    '6 ft',
                                    '7 ft',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  hint: Text("Feet "),
                                  onChanged: this.isProfileEdit == false
                                      ? null
                                      : (String? value) {
                                          setState(() {
                                            _chosenValueFeet = value;
                                          });
                                        },
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  //Dropdown button for inches
                                  value: _chosenValueInches,
                                  style: TextStyle(color: Colors.black),

                                  items: <String>[
                                    '0 in',
                                    '1 in',
                                    '2 in',
                                    '3 in',
                                    '4 in',
                                    '5 in',
                                    '6 in',
                                    '7 in',
                                    '8 in',
                                    '9 in',
                                    '10 in',
                                    '11 in',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value2) {
                                    return DropdownMenuItem<String>(
                                      value: value2,
                                      child: Text(value2),
                                    );
                                  }).toList(),
                                  hint: Text("Inches "),
                                  onChanged: this.isProfileEdit == false
                                      ? null
                                      : (String? value2) {
                                          setState(() {
                                            _chosenValueInches = value2;
                                          });
                                        },
                                ),
                              )
                            ] //ending of row widget
                            ),
                      ),
                      TextField(
                        enabled: this.isProfileEdit,
                        enableInteractiveSelection: this.isProfileEdit,
                        controller: _goalWeightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Goal Weight in lbs',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('Current BMI:'),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                NumberFormat.compactCurrency(
                                  decimalDigits: 2,
                                  symbol: '', // if you want to add currency symbol then pass that in this else leave it empty.
                                ).format(Utils.getBMI),
                              ),
                            ] //ending of row widget
                            ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      this.isProfileEdit ?
                      ElevatedButton(
                        onPressed: saveAction,
                        child: Text('Save'),
                      ) : Container(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
