class GoogleSearchModel {
  String? title;
  String? image;
  String? thumbnail;
  String? url;
  int? height;
  int? width;
  String? source;

  GoogleSearchModel(
      {this.title,
      this.image,
      this.thumbnail,
      this.url,
      this.height,
      this.width,
      this.source});

  GoogleSearchModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    url = json['url'];
    height = json['height'];
    width = json['width'];
    source = json['source'];
  }

}
