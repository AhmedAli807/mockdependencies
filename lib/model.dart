class Model{
  final int userId;
  final int id;
  final String title;
  Model({required this.title,required this.id,required this.userId});
  factory Model.fromJson(Map<String,dynamic>json){
    return Model(
        title: json['title'],
        id: json['id'],
        userId: json['userId']
    );
  }

}