class HotelModel {
  String? id;
  String? title;
  String? description;
  String? image;
  dynamic price;
  dynamic rating;

  HotelModel({
    this.id,
    this.title,
    this.description,
    this.image,
    this.price,
    this.rating,
  });

  HotelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['rating'] = this.rating;
    return data;
  }
}
