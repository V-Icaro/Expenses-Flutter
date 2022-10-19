import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
    this.transactions,
    this.onRemove,
  });

  final List<Transaction>? transactions;
  final void Function(String)? onRemove;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      //Condição para exibir lista caso exista transações,
      //Senão, será exibido imagem.
      child: transactions!.isEmpty
          ? Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'Nenhuma Transação Cadastrada!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions!.length,
              itemBuilder: (ctx, index) {
                final tr = transactions![index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: FittedBox(
                          child: Text(
                            'R\$${tr.value!.toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title!,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date!),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () => onRemove!(tr.id!),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
