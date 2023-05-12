import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/pages/user_orders/containers/user_applications_list.dart';
import 'package:jobee_app/pages/user_orders/containers/user_orders_list.dart';
import 'package:jobee_app/widgets/content_box.dart';

class UserOrdersView extends StatelessWidget {
  const UserOrdersView({super.key});

  Widget _buildTabBarItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: AppTheme.colors.primaryBgColor,
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        automaticIndicatorColorAdjustment: true,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppTheme.colors.secondaryBgColor,
        ),
        tabs: [
          _buildTabBarItem('my_orders'.tr()),
          _buildTabBarItem('my_applications'.tr()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          ContentBox(
            borderRadius: BorderRadius.circular(0),
            width: double.infinity,
            color: AppTheme.colors.primaryColor,
            child: SafeArea(
              bottom: false,
              child: _buildTabBar(),
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                UserOrdersList(),
                UserApplicationsList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
