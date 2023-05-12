import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/models/order.dart';
import 'package:jobee_app/pages/order_page/order_page.dart';
import 'package:jobee_app/widgets/material_inkwell.dart';
import 'package:jobee_app/widgets/svg_view.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard(this.order, {super.key});

  Widget _buildTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.network(order.icon, width: 54, height: 54),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                order.userName,
                style: AppTheme.applyFontWeight(const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetails() {
    final dateFormat = DateFormat('dd.MM.yyyy, HH:mm');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          order.location,
          style: AppTheme.applyFontWeight(const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
          )),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dateFormat.format(order.createdAt),
              style: AppTheme.applyFontWeight(const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              )),
            ),
            if (order.deadline != null) _buildDeadline()
          ],
        )
      ],
    );
  }

  Widget _buildDeadline() {
    final deadlineFormat = DateFormat('dd.MM.yyyy');
    final isUrgent = DateTime.now().difference(order.deadline!).inDays <= 3;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppTheme.colors.primaryColor,
      ),
      child: Row(
        children: [
          Text(
            deadlineFormat.format(order.deadline!),
            style: AppTheme.applyFontWeight(const TextStyle(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            )),
          ),
          if (isUrgent)
            const Padding(
              padding: EdgeInsets.only(left: 6),
              child: SvgView('urgent-order', height: 12),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppTheme.colors.primaryBgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: MaterialInkWell(
        onTap: () =>
            context.goNamed(OrderPage.path, params: {'orderId': '${order.id}'}),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            const SizedBox(height: 8),
            _buildDetails(),
          ],
        ),
      ),
    );
  }
}
