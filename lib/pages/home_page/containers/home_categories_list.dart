import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobee_app/models/arguments.dart';
import 'package:jobee_app/models/category.dart';
import 'package:jobee_app/pages/home_page/widgets/home_category_card.dart';
import 'package:jobee_app/pages/orders_page/orders_page.dart';

class HomeCategoriesList extends StatelessWidget {
  final List<Category> categories;

  const HomeCategoriesList(this.categories, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, idx) => HomeCategoryCard(
          onTap: () => context.goNamed(
            OrdersPage.path,
            extra: OrdersArgs(
              category: categories[idx],
            ),
          ),
          category: categories[idx],
        ),
      ),
    );
  }
}
