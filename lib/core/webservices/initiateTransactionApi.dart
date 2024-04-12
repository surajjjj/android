//This is api for the razorpay transaction
import 'dart:convert';

import 'package:egrocer/core/constant/apiAndParams.dart';
import 'package:egrocer/core/widgets/generalMethods.dart';
import 'package:flutter/material.dart';

Future<Map<String, dynamic>> getInitiatedTransactionApi(
    {required BuildContext context,
    required Map<String, dynamic> params}) async {
  var response = await GeneralMethods.sendApiRequest(
      apiName: ApiAndParams.apiInitiateTransaction,
      params: params,
      isPost: true,
      context: context);
  return json.decode(response);
}

//This is api for the razorpay transaction
Future<Map<String, dynamic>> getPaytmTransactionTokenApi(
    {required BuildContext context,
    required Map<String, dynamic> params}) async {
  var response = await GeneralMethods.sendApiRequest(
      apiName: ApiAndParams.apiPaytmTransactionToken,
      params: params,
      isPost: false,
      context: context);

  return json.decode(response);
}
