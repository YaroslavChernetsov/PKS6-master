class Product {
  final String name;
  final int price;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.image,
  });

  // Переопределяем оператор равенства для корректного сравнения объектов
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          price == other.price &&
          image == other.image;

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ image.hashCode;
}
