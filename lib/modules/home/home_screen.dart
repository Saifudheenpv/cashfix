import 'package:flutter/material.dart';
import 'components/summary_card.dart';
import '../../models/transaction_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = [
      Transaction(
          id: 't1',
          title: 'Groceries',
          amount: 500,
          type: 'given',
          date: DateTime.now()),
      Transaction(
          id: 't2',
          title: 'Friend Payback',
          amount: 1000,
          type: 'received',
          date: DateTime.now()),
    ];

    final double totalGiven = transactions
        .where((t) => t.type == 'given')
        .fold(0, (sum, t) => sum + t.amount);
    final double totalReceived = transactions
        .where((t) => t.type == 'received')
        .fold(0, (sum, t) => sum + t.amount);

    return Scaffold(
      appBar: AppBar(title: const Text('CashFix Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SummaryCard(
              title: 'Total Given',
              amount: totalGiven,
              color: Colors.red,
              icon: Icons.arrow_upward_rounded,
            ),
            const SizedBox(height: 12),
            SummaryCard(
              title: 'Total Received',
              amount: totalReceived,
              color: Colors.green,
              icon: Icons.arrow_downward_rounded,
            ),
            const SizedBox(height: 12),
            SummaryCard(
              title: 'Balance',
              amount: totalReceived - totalGiven,
              color: Colors.blue,
              icon: Icons.account_balance_wallet_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
