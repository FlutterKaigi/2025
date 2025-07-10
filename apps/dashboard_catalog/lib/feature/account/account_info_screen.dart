import 'package:dashboard/features/account/ui/info/account_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AccountInfoScreen',
  type: AccountInfoScreen,
  path: '[Feature]/account',
)
Widget accountInfoScreenUseCase(BuildContext context) => AccountInfoScreen(
  onProfileEdit: () {},
);
