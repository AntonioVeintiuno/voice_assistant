class Orders {
  List<Order> orders = new List();
  //constructor
  Orders();

  Orders.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var i in jsonList) {
      final order = new Order.fromJson(i);
      orders.add(order);
    }
  }
}

class Order {
  int id;
  String orderNumber;
  String user;
  String products;
  double currentPrice;
  double originalPrice;
  double discount;
  String sku;
  String unitType;
  double unitPrice;
  double weight;
  int quantity;
  String status;

  Order({
    this.id,
    this.orderNumber,
    this.sku,
    this.unitPrice,
    this.unitType,
    this.weight,
    this.quantity,
    this.status,
    this.user,
    this.products,
    this.currentPrice,
    this.originalPrice,
    this.discount,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: json['id'],
        orderNumber: json['orderNumber'],
        user: json['user'],
        sku: json['sku'],
        unitType: json['unit_type'],
        weight: json['weight'] / 1,
        quantity: json['quantity'],
        status: json['status'],
        discount: json['discount_price'] / 1,
        originalPrice: json['unit_price'] / 1,
        currentPrice: json['unit_price'] / 1);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'orderNumber': orderNumber,
      'user': user,
      'products': products,
      'currentPrice': currentPrice,
      'originalPrice': originalPrice,
      'unitType': unitType,
      'weight': weight,
      'quantity': quantity,
      'status': status,
      'discount': discount,
    };
  }
}
