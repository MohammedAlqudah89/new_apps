import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget
{
  final int result;
  final int age;
  final bool isMale;
   BMIResult({
  required this.isMale,
  required this.age,
  required this.result,
});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Results'),
        leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left_sharp,),
        onPressed: () {
         Navigator.pop(context);
        },
      ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text('Gender: ${ isMale ? 'Male' : 'Female'}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),),
            Text('Results: $result',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),
            Text('Age: $age',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),),
          ],
        ),
      ),
    );
  }

}