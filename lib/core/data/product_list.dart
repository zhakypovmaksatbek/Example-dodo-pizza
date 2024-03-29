import 'package:example/presentation/constants/path_manager.dart';
import 'package:example/presentation/models/product_model.dart';

final class ProductList {
  static final List<ProductModel> products = [
    ProductModel(
        name: "Комбо Рамадан",
        price: "925 сом",
        image: SvgAsset.orozo.png,
        description:
            "Для уютных посиделок. 2 маленькие пиццы и напиток на выбор. Для компании из 2 - 4 человек. Цена комбо зависит от выбранных пицц и может быть увеличена"),
    ProductModel(
        name: "Kebab",
        price: "600 som",
        image: SvgAsset.pizza.jpeg,
        description: "Pizza with meat and other information"),
    ProductModel(
        name: "Margarita",
        price: "400 som",
        image: SvgAsset.pizza2.jpeg,
        description: "Pizza with meat and other information"),
    ProductModel(
        name: "Четыре сезона",
        price: "300 som",
        image: SvgAsset.pizza3.png,
        description: "Pizza with meat and other information"),
    ProductModel(
        name: "Додо Микс",
        price: "700 som",
        image: SvgAsset.pizza4.jpeg,
        description: "Pizza with meat and other information"),
    ProductModel(
        name: "Паста Песто",
        price: "100 som",
        image: SvgAsset.pasta.jpeg,
        description:
            "Паста с ветчиной из цыпленка, сырами моцарелла, чеддер и пармезан, томатами, чесноком и фирменным соусом альфредо"),
    ProductModel(
        name: "Паста Мясная",
        price: "200 som",
        image: SvgAsset.pasta.jpeg,
        description:
            "Паста с фаршем из говядины, моцареллой, чесноком, соусом бургер и фирменным томатным соусом"),
    ProductModel(
        name: "Чизкейк",
        price: "159 som",
        image: SvgAsset.cheesecake.png,
        description:
            "Классический американский десерт с мягким бархатистым вкусом"),
    ProductModel(
        name: "Чизкейк Банановый с шоколадным печеньем",
        price: "159 som",
        image: SvgAsset.cheesecake2.png,
        description:
            "Классический американский десерт с мягким бархатистым вкусом"),
    ProductModel(
        name: "Маффин соленая карамель",
        price: "159 som",
        image: SvgAsset.cheesecake3.jpeg,
        description:
            "Классический американский десерт с мягким бархатистым вкусом"),
    ProductModel(
        name: "Кофе Латте",
        price: "159 som",
        image: SvgAsset.coffee.jpeg,
        description:
            "Классический американский десерт с мягким бархатистым вкусом"),
    ProductModel(
        name: "Кофе Американо",
        price: "159 som",
        image: SvgAsset.coffee2.jpeg,
        description:
            "Классический американский десерт с мягким бархатистым вкусом"),
    ProductModel(
        name: "Ванильный Айс Латте",
        price: "159 som",
        image: SvgAsset.coffee3.jpeg,
        description:
            "Классический американский десерт с мягким бархатистым вкусом"),
    ProductModel(
        name: "Ванильный Айс Латте",
        price: "159 som",
        image: SvgAsset.mayonez.png,
        description:
            "Классический американский десерт с мягким бархатистым вкусом"),
    ProductModel(
        name: "Ванильный Айс Латте",
        price: "159 som",
        image: SvgAsset.ketchup.png,
        description:
            "Классический американский десерт с мягким бархатистым вкусом"),
  ];
}
