import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget
{
  @override
  _counterScreen createState() {

    return _counterScreen();
  }

}
class _counterScreen extends State<CounterScreen>
{
  int counter =1;
  @override
  void initState ()
  {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(onPressed:(){
                setState(()
                    {
                      counter++;
                      print('$counter');
                    });
              },
              child: Icon(
              Icons.add,
              ),
              ),
              SizedBox(
                height: 8.0,
              ),
              FloatingActionButton(onPressed:(){
                setState(()
                {
                  counter--;
                  print('$counter');
                });
              },
                child: Icon(
                  Icons.minimize,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(
              '$counter',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 50.0,
            ),
          ),
        ],
      ),

    );
  }


}