class UserField {
  static const String name = 'name';
  static const String isStoreOwner = 'isStoreOwner';
  static const String profilePhoto = 'profilePhoto';
}

class ProductField {
  static const String name = 'name';
  static const String store = 'store';
  static const String category = 'category';
  static const String description = 'description';
  static const String isBiddable = 'isBiddable';
  static const String bidStart = 'bidStart';
  static const String bidEnd = 'bidEnd';
  static const String price = 'price';
  static const String displayImage = 'displayImage';
  static const String isPublished = 'isPublished';
}

class CategoryField {
  static const String name = 'name';
  static const String description = 'description';
  static const String store = 'store';
}

class BidField {
  static const String product = 'product';
  static const String store = 'store';
  static const String amount = 'amount';
  static const String user = 'user';
}

class OrderField {
  static const String amount = 'amount';
  static const String product = 'product';
  static const String status = 'status';
  static const String price = 'price';
  static const String total = 'total';
  static const String user = 'user';
  static const String productCopy = 'productCopy';
}

class StoreField {
  static const String name = 'name';
  static const String address = 'address';
  static const String contactNumber = 'contactNumber';
  static const String displayImage = 'displayImage';
  static const String user = 'user';
  static const String description = 'description';
  static const String isPublished = 'isPublished';
}
