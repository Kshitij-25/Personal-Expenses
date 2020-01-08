import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    "No transactions added yet!",
                    style: Theme.of(context).textTheme.title,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.88,
                    child: Image.asset(
                      'assets/images/adasd.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              // return Card(
              //   elevation: 5,
              //   child: Row(
              //     children: <Widget>[
              //       Container(
              //         margin:
              //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //               color: Theme.of(context).primaryColor, width: 2),
              //         ),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           '₹ ${transactions[index].amount}',
              //           // '\$${tx.amount}', for dollar
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Theme.of(context).primaryColor),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           Text(
              //             transactions[index].title,
              //             style: Theme.of(context).textTheme.copyWith().title,
              //           ),
              //           Text(
              //             DateFormat.yMMMMd()
              //                 .format(transactions[index].date),
              //             style: TextStyle(fontSize: 13, color: Colors.grey),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // );
              return TransactionItem(
                  transaction: transactions[index], deleteTx: deleteTx);
            },
            itemCount: transactions.length,
          );
  }
}
