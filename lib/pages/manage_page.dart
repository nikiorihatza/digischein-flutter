import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/reports_provider.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  @override
  Widget build(BuildContext context) {
    final reportsProvider = Provider.of<ReportsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ARBEITSSCHEINE VERWALTEN'),
     ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: reportsProvider.reports.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const Text('Keine Arbeitsscheine verfügbar');
                } else {
                  final report = reportsProvider.reports[index];
                  return ListTile(
                    title: Text(report.arbeitsstelle),
                    subtitle: Text(report.datum as String),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
