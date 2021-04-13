class ItemSize {

  ItemSize({this.name, this.stock, this.price});

  ItemSize.fromMap(Map<String, dynamic> map){
    name = map['tamanho'] as String;
    price = map['price'] as num;
    stock = map['stock'] as int;
  }

  String name;
  num price;
  int stock;

  bool get hasStock => stock > 0;

  ItemSize clone(){
    return ItemSize(
        name: name,
        stock: stock,
        price: price
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'tamanho': name,
      'price': price,
      'stock': stock
    };
  }

  @override
  String toString() {
    return 'ItemSize{tamanho: $name, price: $price, stock: $stock}';
  }
}