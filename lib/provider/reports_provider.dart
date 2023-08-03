// providers/reports_provider.dart
import 'package:flutter/material.dart';
import '../model/report.dart';

class ReportsProvider with ChangeNotifier {
  List<Report> _reports = [];

  List<Report> get reports => _reports;

  void addReport(Report report) {
    _reports.add(report);
    notifyListeners();
  }

// Add other methods as needed, e.g., to fetch reports from an API
}