import 'package:egrocer/core/constant/constant.dart';
import 'package:egrocer/core/model/productListItem.dart';
import 'package:egrocer/core/provider/productChangeListingProvider.dart';
import 'package:egrocer/core/provider/productSearchProvider.dart';
import 'package:egrocer/core/widgets/defaultBlankItemMessageScreen.dart';
import 'package:egrocer/core/widgets/generalMethods.dart';
import 'package:egrocer/core/widgets/productGridItemContainer.dart';
import 'package:egrocer/core/widgets/productListItemContainer.dart';
import 'package:egrocer/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchProductWidget extends StatefulWidget {
  const SearchProductWidget({super.key});

  @override
  State<SearchProductWidget> createState() => _SearchProductWidgetState();
}

class _SearchProductWidgetState extends State<SearchProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductSearchProvider>(
      builder: (context, productSearchProvider, _) {
        List<ProductListItem> products = productSearchProvider.products;
        if (productSearchProvider.productSearchState ==
            ProductSearchState.initial) {
          return getProductListShimmer(
              context: context,
              isGrid: context
                  .read<ProductChangeListingTypeProvider>()
                  .getListingType());
        } else if (productSearchProvider.productSearchState ==
            ProductSearchState.loading) {
          return getProductListShimmer(
              context: context,
              isGrid: context
                  .read<ProductChangeListingTypeProvider>()
                  .getListingType());
        } else if (productSearchProvider.productSearchState ==
            ProductSearchState.loaded ||
            productSearchProvider.productSearchState ==
                ProductSearchState.loadingMore) {
          return Column(
            children: [
              context
                  .read<ProductChangeListingTypeProvider>()
                  .getListingType() ==
                  true
                  ? /* GRID VIEW UI */ GridView.builder(
                itemCount: products.length,
                padding: EdgeInsetsDirectional.only(
                    start: Constant.size10,
                    end: Constant.size10,
                    bottom: Constant.size10,
                    top: Constant.size5),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ProductGridItemContainer(
                      product: products[index]);
                },
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              )
                  : /* LIST VIEW UI */ Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(products.length, (index) {
                  return ProductListItemContainer(
                    product: products[index],
                    listSimilarProductListItem: products,
                  );
                }),
              ),
              if (productSearchProvider.productSearchState ==
                  ProductSearchState.loadingMore)
                getProductItemShimmer(
                    context: context,
                    isGrid: context
                        .read<ProductChangeListingTypeProvider>()
                        .getListingType()),
            ],
          );
        } else {
          return DefaultBlankItemMessageScreen(
            title: getTranslatedValue(
              context,
              "lblEmptyProductListMessage",
            ),
            description: getTranslatedValue(
              context,
              "lblEmptyProductListDescription",
            ),
            image: "no_product_icon",
          );
        }
      },
    );
  }
}
