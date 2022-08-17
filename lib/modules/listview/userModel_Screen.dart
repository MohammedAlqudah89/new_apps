import 'package:flutter/material.dart';
import 'package:new_apps/models/user/user_model.dart';


class UserModel extends StatelessWidget {
  List<UserM> users= [
    UserM(
        id: 1,
        name: 'Mohammed Alqudah',
        phone: '+5654613216',

    ),
    UserM(
      id: 2,
      name: 'ahmed Alqudah',
      phone: '+23423523',

    ),
    UserM(
      id: 3,
      name: 'ali ahmed',
      phone: '+556256432',

    ),
    UserM(
      id: 4,
      name: 'kamel ali',
      phone: '+965462233',

    ),
    UserM(
      id: 5,
      name: 'ziad Alqudah',
      phone: '+784132156465',

    ),
    UserM(
      id: 6,
      name: 'ali ahmed',
      phone: '+12313456456',

    ),
    UserM(
      id: 1,
      name: 'Mohammed Alqudah',
      phone: '+5654613216',

    ),
    UserM(
      id: 2,
      name: 'ahmed Alqudah',
      phone: '+23423523',

    ),
    UserM(
      id: 3,
      name: 'ali ahmed',
      phone: '+556256432',

    ),
    UserM(
      id: 4,
      name: 'kamel ali',
      phone: '+965462233',

    ),
    UserM(
      id: 5,
      name: 'ziad Alqudah',
      phone: '+784132156465',

    ),
    UserM(
      id: 6,
      name: 'ali ahmed',
      phone: '+12313456456',

    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Model ListView app'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => listuserModel(users[index]),
          separatorBuilder: (context, index)=> Container(
            height: 1,width: double.infinity, color: Colors.grey,),
          itemCount: users.length,
      ),
    );
  }
  Widget listuserModel(UserM model) =>  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blue,
            child: Text(
              '${model.id}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model.name}',
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${model.phone}',
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),

  );
}
