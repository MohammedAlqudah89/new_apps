import 'package:flutter/material.dart';

class ListviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View app'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index)
                {
                  return StoryList();
                },
                itemCount: 12,
              ),
            ),
              ListView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                    itemBuilder: (context, index)
                {
                  return ChatItemList();
                },
                  itemCount: 12,
                ),

          ],
        ),
      ),
    );
  }
  Widget StoryList() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.blueAccent,
            backgroundImage: NetworkImage(
                'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
          ),
        ),
      ],
    );
  }
  Widget ChatItemList() =>  Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            radius: 35.0,
            backgroundColor: Colors.blueAccent,
            backgroundImage: NetworkImage(
                'https://www.hudson.cn/wp-content/cache/bb-plugin/cache/personal-brand-1024x731-landscape.png'),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Angel',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )
            ),
            Row(
              children: [
                Text('asdfasdasdasd',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),),
                SizedBox(
                  width: 20.0,
                ),
                Text('02:30 pm',
                    style:TextStyle(
                      color: Colors.blue,
                    )),
              ],
            ),
          ],
        ),
      ],

  );
}


