class User {
  String? id;
  String name;
  int age;
  String job;
  double height;
  String adress;

  User({
    required this.name,
    required this.adress,
    required this.height,
    required this.job,
    required this.age,
    this.id,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        job = json['job'],
        height = json['height'],
        adress = json['adress'];

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "job": job,
        "height": height,
        "adress": adress,
      };
}
