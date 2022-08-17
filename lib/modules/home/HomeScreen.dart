import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
        ),
        title: Text(
          'First App',
        ),
        actions: [
          IconButton(
            onPressed: onNotifications,
            icon: Icon(
              Icons.notification_important,
            ),
          ),
          IconButton(
            onPressed: () {
              print('Search Clicked');
            },
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Text(
                'First Text',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              'second Text',
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Container(
            child: Text(
              'Third Text',
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Container(
            child: Text('Fourth Text', style:TextStyle(
              color: Colors.white,
              backgroundColor: Colors.red,
            ),
            ),
          ),
        ],
      ),
    );
  }

  void onNotifications() {
    print('notification clicked functions');
  }
}
