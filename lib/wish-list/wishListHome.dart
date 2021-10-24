import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintage_games/constants/strings.dart';
import 'controller/wishListController.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Products _p = Get.put(Products());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyStrings.wishlist),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child:  GridView.builder(
                  itemCount: _p.items.length,
                  primary: false,
                  physics: ScrollPhysics(),
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    final product = _p.items[index];
                    return Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Card(
                          key: ValueKey(product.id),
                          // color: Colors.blue,
                          child: Stack(
                            children: [
                              Image(image: NetworkImage(product.image),fit: BoxFit.cover,),
                              Align(
                                alignment: Alignment.topRight,
                                child: Obx(() => IconButton(
                                  onPressed: () {
                                    if (product.inWishList.value == false) {
                                      _p.addItem(product.id);
                                    } else {
                                      _p.removeItem(product.id);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: product.inWishList.value == false
                                        ? Colors.white
                                        : Colors.red,
                                  ),
                                )),
                              ),
                            ],
                          ),
                        ));
                  })),
        ],
      ),
    );
  }
}