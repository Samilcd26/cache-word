class SelectTestCardData {
  String title;
  String icon;
  double rating;

  SelectTestCardData({required this.title, required this.icon, required this.rating});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['icon'] = this.icon;
    data['rating'] = this.rating;
    return data;
  }
}
