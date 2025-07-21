import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/action_button_row.dart';
import '../widgets/balance_card.dart';
import '../widgets/transaction_item.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(child: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Online Banking', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(height: 24,),
            BalancedCard(),
            SizedBox(height: 24,),
            ActionButtonRow(),
            SizedBox(height: 32,),
            Text('Recent Transactions', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(height: 16,),
            Column(
              children: [
                TransactionItem(
                  icon: Icons.shopping_cart,
                  title: 'Grocery Store',
                  date: 'June 21',
                  amount: '-\$50.00',
                  amountColor: Colors.red,
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
