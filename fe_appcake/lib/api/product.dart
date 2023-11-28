class Product{
  final int id_product;
  final String productName;
  final String productImage;
  final bool productPrice;
  final String productCategory;
  final String productDiameter;
  final String productHeight;
  final String productDescription;

  Product(
    this.id_product,
    this.productName,
    this.productImage,
    this.productPrice,
    this.productCategory,
    this.productDiameter,
    this.productHeight,
    this.productDescription
  );

  factory Product.fromJson(Map<String, dynamic> data){
    return Product (
      data['id_product'],// đoạn này là đoạn lấy json
      data['product_name'],
      data['product_image'],
      data['product_price'],
      data['product_category'],
      data['product_diameter'],
      data['product_height'],
      data['product_description']
    );
  }
}