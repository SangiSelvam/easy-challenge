import 'package:get/get.dart';

class Item {
  int id;
  String image;
  RxBool inWishList;
  Item(
      {required this.id,
        required this.image,
        required this.inWishList});
}