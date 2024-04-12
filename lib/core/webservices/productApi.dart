import 'dart:convert';

import 'package:egrocer/core/constant/apiAndParams.dart';
import 'package:egrocer/core/model/productListItem.dart';
import 'package:egrocer/core/widgets/generalMethods.dart';
import 'package:flutter/material.dart';

Future<Map<String, dynamic>> getProductListApi(
    {required BuildContext context,
    required Map<String, dynamic> params}) async {
  print(params);
  var response = await GeneralMethods.sendApiRequest(
      apiName: ApiAndParams.apiProducts,
      params: params,
      isPost: true,
      context: context);
  var getData = json.decode(response);

  return getData;
}

Future<List<ProductListItem>> getFavoriteProductListApi(
    {required BuildContext context,
    required Map<String, dynamic> params}) async {
  var response = await GeneralMethods.sendApiRequest(
      apiName: ApiAndParams.apiFavorites,
      params: params,
      isPost: true,
      context: context);
  var getData = json.decode(response);

  if (getData[ApiAndParams.status].toString() == "1") {
    return (getData['data'] as List)
        .map((e) => ProductListItem.fromJson(Map.from(e)))
        .toList();
  } else {
    return [];
  }
}

Future<Map<String, dynamic>> getProductDetailApi(
    {required BuildContext context,
    required Map<String, dynamic> params}) async {
  try {
    print(params);
    var data = json.decode(await GeneralMethods.sendApiRequest(
        apiName: ApiAndParams.apiProductDetail,
        params: params,
        isPost: true,
        context: context));

    return data;
  } catch (e) {
    GeneralMethods.showSnackBarMsg(context, e.toString());
    return {};
  }
}

addOrRemoveFavoriteApi(
    {required BuildContext context,
    required Map<String, dynamic> params,
    required isAdd}) async {
  var response = await GeneralMethods.sendApiRequest(
      apiName: isAdd
          ? ApiAndParams.apiAddProductToFavorite
          : ApiAndParams.apiRemoveProductFromFavorite,
      params: params,
      isPost: true,
      context: context);

  var getData = json.decode(response);

  return getData;
}

Future<Map<String, dynamic>> getProductSearchApi(
    {required BuildContext context,
    required Map<String, dynamic> params}) async {
  var response = await GeneralMethods.sendApiRequest(
      apiName: ApiAndParams.apiProducts,
      params: params,
      isPost: true,
      context: context);
  var getData = json.decode(response);
  return getData;
}

Future<Map<String, dynamic>> getProductWishListApi(
    {required BuildContext context,
    required Map<String, dynamic> params}) async {
  var response = await GeneralMethods.sendApiRequest(
      apiName: ApiAndParams.apiFavorite,
      params: params,
      isPost: false,
      context: context);
  var getData = json.decode(response);
  return getData;
}
