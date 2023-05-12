import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/models/arguments.dart';
import 'package:jobee_app/pages/apply_page/apply_cubit.dart';
import 'package:jobee_app/pages/apply_page/view/apply_view.dart';
import 'package:jobee_app/widgets/unfocus_wrapper.dart';

class ApplyPage extends StatelessWidget {
  final ApplyArgs args;
  static const path = 'apply';

  const ApplyPage(this.args, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApplyCubit()..init(args),
      child: const Scaffold(body: UnFocusWrapper(child: ApplyView())),
    );
  }
}
