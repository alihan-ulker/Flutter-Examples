class UserModel {
  String name;
  String imageUrl;
  UserModel({
    required this.name,
    required this.imageUrl,
  });

  factory UserModel.fake() {
    return UserModel(
        name: 'Ali',
        imageUrl:
            'https://avatars.githubusercontent.com/u/49821594?s=400&u=349aec380efb31ff7db1cfe1f3137810a397383a&v=4');
  }
}
