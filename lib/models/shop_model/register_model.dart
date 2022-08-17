class RegisterModel
{
late bool status;
 String? message;
RegisterData? data;

RegisterModel.fromJson(Map<String, dynamic> json)
{
  status= json['status'];
  message= json['message'];
  data= (json['data'] != null ? RegisterData.fromJason(json['data']) : null);

}
}

class RegisterData
{
  late String name;
  late String phone;
  late String email;
  late int id;
  late String password;
  String? image;
  int? points;
  int? credit;
  String? token;

  // named constructor

  RegisterData.fromJason (Map <String, dynamic> json)
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