import 'package:api_getx/controllers/product_controller.dart';
import 'package:api_getx/data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(size),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTop(),
            _buildCategoriesRow(size),
            Expanded(
              child: Obx(() {
                if (controller.loading.value == true) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (controller.products.isEmpty) {
                  return Center(
                    child: Text('No product found'),
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.only(top: 20.0),
                  itemCount: controller.products.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 150,
                      color: Colors.red,
                      margin: EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.products[index]['title'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                        controller.products[index]
                                            ['description'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  Text(
                                    "\$${controller.products[index]['price']}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer _buildCategoriesRow(Size size) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.only(top: 16.0),
      height: size.height * 0.06,
      child: ListView.builder(
          itemCount: catigories.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 16, right: 16, left: 16),
              margin: const EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(),
                  color: index == 0 ? Colors.black : Colors.transparent),
              child: Text(
                catigories[index],
                style:
                    TextStyle(color: index == 0 ? Colors.white : Colors.black),
              ),
            );
          }),
    );
  }

  Row _buildTop() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Clothes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
      ],
    );
  }

  AppBar _buildAppBar(Size size) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      leading: const BackButton(),
      elevation: 0,
      title: Container(
        margin: EdgeInsets.only(right: size.width * 0.12),
        child: const Text(
          'Elzobi Shop',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }
}
