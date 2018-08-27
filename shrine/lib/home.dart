// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shrine/model/product.dart';
import 'package:shrine/model/products_repository.dart';
import 'package:shrine/supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  final Category category;

  const HomePage({this.category = Category.all});

  factory HomePage.forDesignTime() => HomePage();

  @override
  Widget build(BuildContext context) => AsymmetricView(
        products: ProductsRepository.loadProducts(category),
      );

  List<Widget> _buildGridCards(BuildContext context) {
    final theme = Theme.of(context);
    final formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    return ProductsRepository.loadProducts(Category.all)
        .map((product) => Card(
              elevation: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset(
                      product.assetName,
                      package: product.assetPackage,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          product?.name,
                          style: theme.textTheme.button,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          formatter.format(
                            product?.price ?? 0,
                          ),
                          style: theme.textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }
}
