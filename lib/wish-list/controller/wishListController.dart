import 'package:get/get.dart';
import 'package:vintage_games/models/items.dart';

class Products extends GetxController {
  RxList<Item> _items = List.generate(
      10,
          (index) => Item(
          id: index,
          image: 'https://vinusimages.co/wp-content/uploads/2018/10/EG7A2390.jpgA_.jpg',
          inWishList: false.obs)).obs;

  List<Item> get items {
    return [..._items];
  }

  List<Item> get wishListItems {
    return _items.where((item) => item.inWishList.value == true).toList();
  }

  void addItem(int id) {
    final int index = _items.indexWhere((item) => item.id == id);
    _items[index].inWishList.value = true;
  }

  void removeItem(int id) {
    final int index = _items.indexWhere((item) => item.id == id);
    _items[index].inWishList.value = false;
  }
}