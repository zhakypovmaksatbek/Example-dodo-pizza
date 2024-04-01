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
  final ScrollController _scrollController = ScrollController();

  // Seçili kategori indeksi
  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    // Scroll kontrolcüsüne bir listener ekle
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Scroll olayını dinleyen metod
  void _onScroll() {
    // Scroll pozisyonunu kontrol edin ve buna göre kategori indeksini güncelleyin
    setState(() {
      _selectedCategoryIndex =
          ((_scrollController.offset / MediaQuery.of(context).size.width)
              .floor());
    });
  }

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
            controller: _scrollController,
            slivers: [
              //Bannner
              SliverToBoxAdapter(
                child: BannerCard(),
              ),
              //Category
              SliverAppBar(
                backgroundColor: ColorConstants.white,
                surfaceTintColor: ColorConstants.white,
                title: Row(
                  children: [
                    const Icon(Icons.search),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .85,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: category.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              _scrollController.animateTo(
                                index * MediaQuery.of(context).size.width,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Center(
                                child: TitleText(
                                  title: category[index],
                                  color: _selectedCategoryIndex == index
                                      ? ColorConstants
                                          .black // Seçili kategori rengi
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                floating: true,
                pinned: true,
                snap: true,
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
