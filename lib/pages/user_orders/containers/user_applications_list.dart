import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/pages/user_orders/user_orders_cubit.dart';
import 'package:jobee_app/widgets/applications_list.dart';
import 'package:jobee_app/widgets/content_box.dart';
import 'package:jobee_app/widgets/loader.dart';
import 'package:jobee_app/widgets/no_applications.dart';

class UserApplicationsList extends StatelessWidget {
  const UserApplicationsList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<UserOrdersCubit>();
    final applications = cubit.state.userApplications;

    if (applications == null) return const Loader();
    if (applications.isEmpty) return const NoApplications();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ContentBox(
        child: ApplicationsList(applications),
      ),
    );
  }
}
