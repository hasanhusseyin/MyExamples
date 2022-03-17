class Product {
  int id = 0;
  int categoryId = 0;
  String productName = "";
  String quantityPerUnit = "";
  double unitPrice = 0;
  int unitsInStock = 0;

  Product(this.id, this.categoryId, this.productName, this.quantityPerUnit,
      this.unitPrice, this.unitsInStock);

  Product.fromJson(Map json) {
    id = json["id"];
    categoryId = json["categoryId"];
    productName = json["productName"];
    quantityPerUnit = json["quantityPerUnit"];
    unitPrice = double.parse(json["unitPrice"].toString());
    unitsInStock = int.parse(json["unitsInStock"].toString());
  }

  Map toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "productName": productName,
      "quantityPerUnit": quantityPerUnit,
      "unitPrice": unitPrice,
      "unitsInStock": unitsInStock
    };
  }
}
