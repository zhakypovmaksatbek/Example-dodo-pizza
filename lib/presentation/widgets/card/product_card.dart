// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example/presentation/models/product_model.dart';
import 'package:example/presentation/theme/color_constants.dart';
import 'package:example/presentation/widgets/text_widgets/def_text.dart';
import 'package:example/presentation/widgets/text_widgets/title_text.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * .2,
              width: MediaQuery.of(context).size.width * .4,
              child: Image.asset(
                product.image,
              )),
          Container(
            padding: const EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width * .6,
            decoration: customDecoration(ColorConstants.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(
                  title: product.name,
                  color: ColorConstants.black,
                ),
                DefaultText(title: product.description),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: customDecoration(ColorConstants.whiteGrey),
                  child: TitleText(
                      title: product.price, color: ColorConstants.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration customDecoration(Color? color) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color ?? ColorConstants.whiteGrey);
  }
}
