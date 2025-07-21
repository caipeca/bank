import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BalancedCard extends StatelessWidget {
  const BalancedCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.shade800,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Account', style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),),
          SizedBox(height: 8,),
          Text('\$1,2500', style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white),),
          SizedBox(height: 8,),
          Text('•••• 1234', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),)
        ],
      ),
    );
  }
}
