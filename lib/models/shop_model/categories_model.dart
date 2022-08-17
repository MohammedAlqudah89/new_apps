class CategoriesModel {
  late bool status;
  late CategoriesData data;

  CategoriesModel.fromJson(Map<String,dynamic> json)
  {
    status = json['status'];
    data=CategoriesData.fromJson(json['data']);
  }

}

class CategoriesData {
  late int currentPage;
  late List<DataModel> data =[];

  CategoriesData.fromJson(Map<String,dynamic> json)
  {
    currentPage=json['current_page'];
    json['data'].forEach((element) {
      data.add(DataModel.fromJson(element));
    });
  }
}

class DataModel {
  late int id;
  late String name;
  late String image;

  DataModel.fromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    name=json['name'];
    image=json['image'];

  }
}
