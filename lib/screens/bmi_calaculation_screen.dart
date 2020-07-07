import 'package:bmi_calculator_app/model/bmi_models.dart';
import 'package:bmi_calculator_app/screens/result_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BMIClaculationScreen extends StatefulWidget {
  @override
  _BMIClaculationScreenState createState() => _BMIClaculationScreenState();
}

class _BMIClaculationScreenState extends State<BMIClaculationScreen> {
  double _userHight ;
  double _userWeight ;
  double bmiCalac ;
TextEditingController _controllerHight=new TextEditingController();
  TextEditingController _controllerWeight=new TextEditingController();
  BMIModels _bmiModels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 300,
                  height: 300,
                  child: Image.asset(
                    'assets/image/bmi.jpg',
                    fit: BoxFit.contain,
                  )),
              Text(
                'We Care about Your Health',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Height(cm)',
                style: Theme.of(context).textTheme.headline3,
              ),
              Container(
                padding: EdgeInsets.all(5.00),
                 child: TextField(
                   onChanged: (height){
                     setState(() {
                       _userHight=double.parse(height);
                     });
                   },
                   controller:_controllerHight ,
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     border:OutlineInputBorder(
                       borderRadius: BorderRadius.circular(30)
                     ),
                     hintText: 'Enter Your Height In cm',
                     hintStyle: Theme.of(context).textTheme.headline2,
                   ),
               ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Weight(kg)',
                style: Theme.of(context).textTheme.headline3,
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: TextField(
                  onChanged: (weight){
                    _userWeight=double.parse(weight);
                  },
                  controller: _controllerWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'Enter Your Weight in kg',
                    hintStyle: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  child: FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        bmiCalac = _userWeight /
                            ((_userHight / 100) * (_userHight / 100));
                        if (bmiCalac >= 18.5 && bmiCalac <= 25) {
                          _bmiModels = BMIModels(
                              bmi: bmiCalac,
                              isNormal: true,
                              comments: 'Your Fit');
                        } else if (bmiCalac < 18.5) {
                          _bmiModels = BMIModels(
                              bmi: bmiCalac,
                              isNormal: false,
                              comments: 'Your UnderWeighted Actually');
                        } else if (bmiCalac > 25 && bmiCalac <= 30) {
                          _bmiModels = BMIModels(
                              bmi: bmiCalac,
                              isNormal: false,
                              comments: 'Your OverWeighted Actually');
                        } else {
                          _bmiModels = BMIModels(
                              bmi: bmiCalac,
                              isNormal: false,
                              comments: 'Your Obesed');
                        }
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen(_bmiModels)
                          ));
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    label: Text(
                      'CALCULATE',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Theme.of(context).accentColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
