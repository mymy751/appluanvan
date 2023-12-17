
class Product{
  final int id_product;
  final String productName;
  final String productImage;
  final String productPrice;
  final String productCategory;
  final num productDiameter;
  final num productHeight;
  final String productDescription;

  Product(
    this.id_product,
    this.productName,
    this.productImage,
    this.productPrice,
    this.productCategory,
    this.productDiameter,
    this.productHeight,
    this.productDescription,
  );

  factory Product.fromJson(Map<String, dynamic> data){
    return Product (
      data['id_product'] ?? 0,// đoạn này là đoạn lấy json
      data['product_name'] ?? '',
      data['product_image'] ?? '',
      data['product_price'] ?? '',
      data['product_category'] ?? '',
      data['product_diameter'] ?? 0,
      data['product_height'] ?? 0,
      data['product_description'] ?? ''
    );
  }
}