import 'dart:ffi';

class Category {
  final int id_category;
  final String categoryName;

  Category(this.id_category, this.categoryName);

  factory Category.fromJson(Map<String, dynamic> data ){
    return Category(
        data["id_category"],
        data["category_name"]
    );
  }
}
