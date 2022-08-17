class UserDataModel
{
  late bool status;

    UserData? data;

  UserDataModel.fromJason(Map <String,dynamic> json)
  {
    status = json['status'];

    data = (json['data'] != null ? UserData.fromJason(json['data']) : null);
    //(json['data'] != null ? UserData.fromJason(json['data']) : null);
  }

}

class UserData
{
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late int points;
  late int credit;
  late String token;

  // named constructor

  UserData.fromJason (Map <String, dynamic> json)
  {
    id=json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    points=json['points'];
    credit=json['credit'];
    token=json['token'];
  }
}