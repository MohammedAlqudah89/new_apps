import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_apps/modules/bmi_calculator/bmi_result/BMIResult_Screen.dart';

class BMICalculator extends StatefulWidget
{


  @override
  State<StatefulWidget> createState() {
    return _BMICalculator();
  }
}

class _BMICalculator extends State<BMICalculator>
{
  bool isMale= true;
  double height= 180.0;
  double weight =60.0;
  int age=30;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: ()
                        {
                          setState((){
                            isMale=true;
                          }
                          );
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                            Icon(Icons.male,
                            size: 50,),
                            Text('Male',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:30.0,
                            ),
                            ),
                            ],
                          ),
                         decoration: BoxDecoration(
                           color: isMale? Colors.blue:Colors.grey[400],
                        ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: ()
                        {
                          setState(()
                          {
                          isMale=false;
                          });
                        },
                        child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            Icon(Icons.female,
                            size: 50),
                            Text('Female',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:30.0,
                              ),
                            ),
                          ],
                        ),

                        decoration: BoxDecoration(
                          color: !isMale ? Colors.blue : Colors.grey[400],
                        ),
                  ),
                      ),
                    ), ),

                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Column(
                  children: [
                    Text(
                      'Height',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 50,
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children:
                      [
                      Text(
                          '${height.round()}',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'CM',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ],
                    ),
                    Slider(
                        value: height,
                        max: 220,
                        min: 140,

                        onChanged: (value)
                        {
                          setState(()
                        {
                        height=value;
                        }
                          );
                        }
                        ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Column(
                        children:
                        [
                          Text(
                              'Weight',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 40.0
                            ),
                          ),
                          Text(
                              '${weight}',
                          style: TextStyle(
                                  fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              FloatingActionButton(
                                mini: true,
                                child: Icon(Icons.remove,),
                                  onPressed: ()
                                      {
                                        setState(()
                                        {
                                          weight--;
                                        });

                                       print('minus');
                                      },
                                heroTag: 'weight-',

                              ),
                              FloatingActionButton(
                                  mini: true,
                                  child: Icon(Icons.add,),
                                  onPressed: ()
                                  {
                                    setState(()
                                    {
                                      weight++;
                                    });
                                  },
                                heroTag: 'Weight+',
                              ),
                            ],
                          ),
                        ],
                      ),
                      //width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],

                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Column(
                        children:
                        [
                          Text(
                            'AGE',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 40.0
                            ),
                          ),
                          Text(
                            '$age',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              FloatingActionButton(
                                  mini: true,
                                  child: Icon(Icons.remove,),
                                  onPressed: ()
                                  {
                                    setState(()
                                    {
                                      age--;
                                    });
                                  },
                                heroTag: 'age-',
                              ),
                              FloatingActionButton(
                                  mini: true,
                                  child: Icon(Icons.add,),
                                  onPressed: ()
                                  {
                                    setState(()
                                    {
                                      age++;
                                    }
                                    );
                                  },
                                heroTag: 'age+',
                              ),
                            ],
                          ),
                        ],
                      ),
                      //width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: MaterialButton(
                onPressed: ()
                    {

                        Navigator.push(context,
                        MaterialPageRoute(builder: (context)
                        {
                          double result= (weight / pow(height/100, 2));
                          print(result.round());
                          return BMIResult (
                            age:age,
                          result: result.round(),
                          isMale: isMale,
                          );
                        }
                        )
                        );
                      },
              color: Colors.lightBlue,
              child: Text(
                'Calculate',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }

}