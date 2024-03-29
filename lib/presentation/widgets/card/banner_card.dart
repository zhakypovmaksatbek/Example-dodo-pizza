import 'package:example/presentation/constants/box_decoration.dart';
import 'package:example/presentation/constants/path_manager.dart';
import 'package:example/presentation/theme/color_constants.dart';
import 'package:example/presentation/widgets/text_widgets/title_text.dart';
import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  BannerCard({super.key});
  final List<String> banners = [
    SvgAsset.banner.jpeg,
    SvgAsset.banner2.jpeg,
    SvgAsset.banner3.png
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: ProjectBoxDecorations.customDecoration(ColorConstants.white),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: ProjectBoxDecorations.customDecoration(
                ColorConstants.whiteGrey),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: ProjectBoxDecorations.customDecoration(
                      ColorConstants.grey),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * .43,
                            decoration: ProjectBoxDecorations.customDecoration(
                                ColorConstants.white),
                            child: const Center(
                                child: TitleText(
                                    title: "data",
                                    color: ColorConstants.black))),
                        Container(
                            width: MediaQuery.of(context).size.width * .43,
                            decoration: ProjectBoxDecorations.customDecoration(
                                ColorConstants.grey),
                            child: const Center(
                                child: TitleText(
                              title: "data",
                              color: ColorConstants.black,
                            ))),
                      ]),
                ),
                SizedBox(height: height * .01),
                const Divider(),
                SizedBox(height: height * .01),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.directions_run_rounded),
                    TitleText(
                      title: "Bishkek Jusup... Chuy str. No:10/1",
                      color: ColorConstants.black,
                    ),
                    Icon(Icons.navigate_next_outlined),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: height * .015),
          Row(
            children: banners
                .map((e) => Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                            height: height * .13,
                            width: width * .2,
                            child: Image.asset(
                              e,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
