import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action_button.dart';

class ActionButtonRow extends StatelessWidget {
  const ActionButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ActionButton(icon: Icons.account_balance, label: 'Accounts',),
        ActionButton(icon: Icons.download, label: 'Deposit',),
        ActionButton(icon: Icons.sync_alt, label: 'Transfer',),
        ActionButton(icon: Icons.upload, label: 'Withdraw',),
      ],
    );
  }
}
