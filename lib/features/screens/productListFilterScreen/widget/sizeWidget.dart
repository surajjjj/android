import 'package:egrocer/core/model/productList.dart';
import 'package:egrocer/core/provider/productFilterProvider.dart';
import 'package:egrocer/core/utils/styles/colorsRes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

getSizeWidget(List<Sizes> sizes, BuildContext context) {
  return ListView(
    children: List.generate(sizes.length, (index) {
      Sizes size = sizes[index];
      String sizeKey = "${size.size}-${size.unitId}";
      return ListTile(
        onTap: () {
          context.read<ProductFilterProvider>().addRemoveSizes(sizeKey);
        },
        title: Text(
          "${size.size} ${size.shortCode}",
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Checkbox(
          activeColor: ColorsRes.appColor,
          value: context
              .watch<ProductFilterProvider>()
              .selectedSizes
              .contains(sizeKey),
          onChanged: (bool? value) {
            context.read<ProductFilterProvider>().addRemoveSizes(sizeKey);
          },
        ),
      );
    }),
  );
}
