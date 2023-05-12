import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/models/application.dart';
import 'package:jobee_app/widgets/content_box.dart';
import 'package:jobee_app/widgets/material_inkwell.dart';

class ApplicationsList extends StatelessWidget {
  final List<Application> applications;
  final ScrollPhysics? physics;

  const ApplicationsList(
    this.applications, {
    super.key,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: physics,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: applications.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: ApplicationCard(applications[index]),
      ),
    );
  }
}

class ApplicationCard extends StatelessWidget {
  final Application application;

  const ApplicationCard(this.application, {super.key});

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('dd.MM.yyyy, HH:MM');

    return MaterialInkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: ContentBox(
        color: AppTheme.colors.primaryBgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (application.price != null) ...[
              Row(
                children: [
                  Text('${'offers_price'.tr()}:'),
                  const SizedBox(width: 4),
                  ContentBox(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    color: AppTheme.colors.primaryColor,
                    child: Text(
                      '${application.price!}₴',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.colors.primaryBgColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
            Row(
              children: [
                Expanded(child: Text(application.userName)),
              ],
            ),
            const SizedBox(height: 8),
            ContentBox(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              child: Text(
                application.contacts,
                style: TextStyle(color: AppTheme.colors.primaryBgColor),
              ),
            ),
            const SizedBox(height: 8),
            if (application.text != null && application.text!.isNotEmpty) ...[
              Text(application.text!),
              const SizedBox(height: 8),
            ],
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                format.format(application.createdAt!),
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
