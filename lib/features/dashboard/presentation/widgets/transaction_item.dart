import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String amount;
  final Color amountColor;
  const TransactionItem({super.key, required this.icon, required this.title, required this.date, required this.amount, required this.amountColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(icon, color: theme.colorScheme.primary,),
      title: Text(title),
      subtitle: Text(date),
      trailing: Text(amount, style: TextStyle(color: amountColor),),
    );
  }
}
