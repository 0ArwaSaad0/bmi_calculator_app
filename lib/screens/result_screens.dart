import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;
  ResultScreen(this.bmiModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
                width: 200,
                height: 200,
                child: bmiModel.isNormal
                    ? Image.asset(
                        'assets/image/heapy.png',
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/image/sad.jpg',
                        fit: BoxFit.cover,
                      )
                ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Your BMI is ${bmiModel.bmi.round()}',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              ' ${bmiModel.comments}',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              height: 5,
            ),
            bmiModel.isNormal
                ? Text(
                    'Hurray!!Your BMI Is Normal',
                    style: Theme.of(context).textTheme.headline3,
                  )
                : Text(
                    'Sadly!!Your BMI Is Not Normal',
                    style: Theme.of(context).textTheme.headline3,
                  ),
            SizedBox(
              height: 30,
            ),
            FlatButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              label: Text(
                ' Let Calculate Again',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
