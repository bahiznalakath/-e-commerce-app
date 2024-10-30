import 'package:e_commerce_app/home/controllers/home_controller.dart';
import 'package:e_commerce_app/home/screens/product_details_screen.dart';
import 'package:e_commerce_app/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Product List"),
      ),
      body: controller.obx(
            (state) {
          return ListView.separated(
            itemCount: controller.productList.length,
            itemBuilder: (BuildContext context, int index) {
              final product = controller.productList[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() =>const ProductDetailsScreen(), arguments: product);
                },
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CustomImage(
                            width: 100,
                            height: 100,
                            image: product.image ?? ''),

                        // Image.network(
                        //   product.image ?? 'https://via.placeholder.com/100',
                        //   width: 20,
                        //   height: 20,
                        //   fit: BoxFit.cover,
                        // ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const   SizedBox(height: 5),
                              Text(
                                '\$${(product.price *
                                    (1 - (product.discount / 100)))
                                    .toStringAsFixed(2)}',

                                style:const TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                              ),
                              const  SizedBox(height: 5),
                              Text(
                                'Brand: ${product.brand}',
                                style:const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const  Icon(Icons.star, color: Colors.amber),
                                  Text('${product.rating}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const   SizedBox(height: 20);
            },
          );
        },
        onLoading: const Center(child: CircularProgressIndicator()),
        // Loading indicator
        onError: (error) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Failed to load products: $error'),
                ElevatedButton(
                  onPressed: () => controller.getHomeData(),
                  child:const Text('Retry'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
