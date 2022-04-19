import 'package:openfoodfacts/model/parameter/PageNumber.dart';

// "Page number" search API parameter
// The term "Page" is ambiguous (#447) and is in 'package:flutter/material.dart'
// TODO: deprecated from 2022-04-20 (#447); remove when old enough
@Deprecated("Use [PageNumber] instead")
class Page extends PageNumber {
  const Page({required int page}) : super(page: page);
}
