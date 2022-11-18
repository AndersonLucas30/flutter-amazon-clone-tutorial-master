import 'package:amazon_clone_tutorial/common/widgets/loader.dart';
import 'package:amazon_clone_tutorial/features/home/services/home_services.dart';
import 'package:amazon_clone_tutorial/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone_tutorial/models/product.dart';
import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../account/widgets/single_product.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  List<Product>? product;
  late final Product prod_categoria;
  late final  User user;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context);
    setState(() {});
  }

/*   void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailScreen.routeName,
      arguments: product,
    );
  } */

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : Container(
            height: 600,
            /* color: Colors.amber, */
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: product!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                final productData = product![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: InkWell(
                        /* onTap: navigateToDetailScreen, */
                        child: SingleProduct(
                          image: productData.images[0],
                          
                        ),
                      ),
                    ),
                    Text(
                      productData.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                );
              },
            ),
          );
  }
}
