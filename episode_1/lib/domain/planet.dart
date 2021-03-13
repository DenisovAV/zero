class Planet {
  final String name;
  final String image;
  final String price;
  final String description;

  const Planet({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Planet &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          image == other.image &&
          price == other.price &&
          description == other.description;

  @override
  int get hashCode => name.hashCode ^ image.hashCode ^ price.hashCode ^ description.hashCode;

  @override
  String toString() {
    return 'Planet{name: $name, price: $price, description: $description}';
  }
}
