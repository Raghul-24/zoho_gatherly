class StallsModel {
  String image;
  String headline;
  String subtitle;
  String date;

  StallsModel(
      {required this.image, required this.headline, required this.subtitle,required this.date});

  factory StallsModel.fromJson(Map<String, dynamic> json) {
    return StallsModel(
      date: json['date']as String,
        image: json['images']as String,
        headline: json['header']as String,
        subtitle: json['companyName']as String
    );
  }
}