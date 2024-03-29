import 'package:example/core/data/product_list.dart';
import 'package:example/presentation/constants/box_decoration.dart';
import 'package:example/presentation/screens/home/home_mixin.dart';
import 'package:example/presentation/theme/color_constants.dart';
import 'package:example/presentation/widgets/card/banner_card.dart';
import 'package:example/presentation/widgets/card/product_card.dart';
import 'package:example/presentation/widgets/text_widgets/def_text.dart';
import 'package:example/presentation/widgets/text_widgets/title_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  final List<String> category = [
    "Ramazan",
    "Pizza",
    "Deals",
    "Snacks",
    "Dessert",
    "Milkshakes",
    "Coffee",
    "Drinks",
    "Goods",
    "Sauces",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteGrey,
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        backgroundColor: ColorConstants.whiteGrey,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            padding: const EdgeInsets.only(top: 15),
            decoration: ProjectBoxDecorations.profileBoxDecoration(),
            child: const Icon(
              Icons.person,
              size: 40,
            ),
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorConstants.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Row(
              children: [
                Icon(Icons.location_on_sharp),
                DefaultText(
                  title: "Bishkek",
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          )
        ],
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: ColorConstants.white,
          child: CustomScrollView(
            slivers: [
              //Bannner
              SliverToBoxAdapter(
                child: BannerCard(),
              ),
              //Category
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .85,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: category.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Center(
                                child: TitleText(
                                  title: category[index],
                                  color: ColorConstants.black,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Product List
              SliverList.builder(
                itemCount: ProductList.products.length,
                itemBuilder: (context, index) {
                  final product = ProductList.products[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                        padding: const EdgeInsets.only(top: 5),
                        decoration: ProjectBoxDecorations.customDecoration(
                            ColorConstants.white),
                        child: ProductCard(product: product)),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}