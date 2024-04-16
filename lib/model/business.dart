class Business {
  final String? artistName;

  Business({
    this.artistName,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      artistName: json['artistName'] as String?,
    );
  }
}
