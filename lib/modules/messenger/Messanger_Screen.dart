import 'package:flutter/material.dart';

class MessangerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.blue,
                  backgroundImage: NetworkImage(
                      'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
                ),
              ],
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                print('Camera');
              },
              icon: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.blueGrey,
                  child: Icon(
                    Icons.camera_alt,
                    size: 16.0,
                    color: Colors.white,
                  ))),
          IconButton(
              onPressed: () {
                print('Camera');
              },
              icon: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.blueGrey,
                  child: Icon(
                    Icons.edit,
                    size: 16.0,
                    color: Colors.white,
                  ))),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                // The color is out of the radius TextField
                Container(
                  color: Colors.grey,
                  width: 400.0,
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [

                 SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                  'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
                            ),
                            Text(
                              'Angle',
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                  'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
                            ),
                            Text(
                              'Angle',
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                  'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
                            ),
                            Text(
                              'Angle',
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                  'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
                            ),
                            Text(
                              'Angle',
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                  'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
                            ),
                            Text(
                              'Angle',
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                  'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
                            ),
                            Text(
                              'Angle',
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                  'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
                            ),
                            Text(
                              'Angle',
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                  'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
                            ),
                            Text(
                              'Angle',
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.maxFinite,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                  'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
                            ),
                            Text(
                              'Angle',
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Message from Angle',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Hello, are you there!'),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.close,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.maxFinite,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                  'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
                            ),
                            Text(
                              'Angle',
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Message from Angle',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Hello, are you there!'),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.close,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.maxFinite,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                  'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
                            ),
                            Text(
                              'Angle',
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Message from Angle',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Hello, are you there!'),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.close,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.maxFinite,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                  'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
                            ),
                            Text(
                              'Angle',
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Message from Angle',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Hello, are you there!'),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.close,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.maxFinite,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                  'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
                            ),
                            Text(
                              'Angle',
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Message from Angle',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Hello, are you there!'),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.close,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.maxFinite,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                  'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
                            ),
                            Text(
                              'Angle',
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Message from Angle',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Hello, are you there!'),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.close,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.maxFinite,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                  'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
                            ),
                            Text(
                              'Angle',
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Message from Angle',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Hello, are you there!'),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.close,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),),
        ],
      ),
    );
  }
}
