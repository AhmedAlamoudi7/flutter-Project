import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superstore/fb_controllers/fb_fire_store_controller.dart';
import 'package:superstore/models/cart.dart';
import 'package:superstore/models/helpers.dart';
import 'package:superstore/provider/cart-provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> with Helpers {
  String? name;
  String? category;
  String? price;
  String? description;
  String? id;
  String? email;

  @override
  Widget build(BuildContext context) {
    ModalRoute? modalRoute = ModalRoute.of(context);
    if (modalRoute != null) {
      Map<String, dynamic> map =
          modalRoute.settings.arguments as Map<String, dynamic>;
      id = map['id'];
      email = map['email'];
      name = map['name'];
      category = map['gender'];
      price = map['price'];
      description = map['description'];
    }
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Color.fromARGB(255, 190, 39, 196)),
          backgroundColor: Colors.white,
          title: const Text(
            'Product',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.grey.shade800,
              height: 300,
              width: double.infinity,
              child: Image.asset(
                'images/product.jpg',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name ?? 'null',
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: Text(
                          '\$ ${price ?? 'null'}',
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              fontSize: 18, color: Color.fromARGB(255, 190, 39, 196)),
                        )),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Category',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      category ?? 'null',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Description',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description ?? 'null',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 30),         
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

 
}
