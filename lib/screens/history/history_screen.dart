import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/history_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<HistoryProvider>(context).history;

    return Scaffold(
      appBar: AppBar(title: const Text('Historique')),
      body: history.isEmpty
          ? const Center(child: Text('Aucune action enregistrée'))
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (ctx, i) {
                final action = history[i];
                return ListTile(
                  title: Text(action.action),
                  subtitle: Text(
                    'Détails: ${action.details}\nDate: ${action.date}',
                  ),
                );
              },
            ),
    );
  }
}
