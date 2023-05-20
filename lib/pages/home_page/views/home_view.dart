import 'package:flutter/material.dart';
import 'package:jobee_app/pages/home_page/containers/home_categories.dart';

import 'package:jobee_app/pages/home_page/containers/home_search.dart';
import 'package:jobee_app/pages/home_page/containers/recent_orders.dart';
import 'package:jobee_app/widgets/unfocus_wrapper.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return UnFocusWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeSearch(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1000),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            HomeCategories(),
                            SizedBox(height: 16),
                            RecentOrders(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 84),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
