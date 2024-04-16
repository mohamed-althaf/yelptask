class Business {
  final String? name;
  final String id;
  final String image_url;
  final String url;
  final double rating;
  final String phone;
  final bool is_closed;
  final String price;
  final Location location;

  Business({
    this.name,
    required this.is_closed,
    required this.price,
    required this.id,
    required this.image_url,
    required this.url,
    required this.rating,
    required this.phone,
    required this.location,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      name: json['name'] as String?,
      id: json['id'] as String,
      image_url: json['image_url'] as String,
      url: json['url'] as String,
      phone: json['phone'] as String,
      rating: json['rating'] as double,
      is_closed: json['is_closed'] as bool,
      price: json['price'] as String,
      location: Location.fromJson(json['location']),
    );
  }
}

class Location {
  final List display_address;

  Location({required this.display_address});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      display_address: json['display_address'] as List,
    );
  }
}
