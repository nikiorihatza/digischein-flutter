import 'package:digischein_flutter/model/user.dart';
import 'package:flutter/foundation.dart';

enum Pruefung {
  stoerungsbehebung,
  hauptpruefung,
}

class Report {
  int reportId;
  String aufragVon;
  String tck;
  DateTime datum;
  String arbeitsstelle;
  String durchzufuehrendeArbeit;
  bool meldungExecutive;
  String stoerungsmeldung;
  Pruefung pruefung;
  DateTime arbeitDurchgefuehrtAm;
  DateTime arbeitDurchgefuehrtVon;
  DateTime arbeitDurchgefuehrtBis;
  List<User> namen;
  bool arbeitFertig;
  double aufwand;

  Report.empty()
      : reportId = 0,
        aufragVon = '',
        tck = '',
        datum = DateTime.now(),
        arbeitsstelle = '',
        durchzufuehrendeArbeit = '',
        meldungExecutive = false,
        stoerungsmeldung = '',
        pruefung = Pruefung.stoerungsbehebung,
        arbeitDurchgefuehrtAm = DateTime.now(),
        arbeitDurchgefuehrtVon = DateTime.now(),
        arbeitDurchgefuehrtBis = DateTime.now(),
        namen = [],
        arbeitFertig = false,
        aufwand = 0.0;

  Report({
    required this.reportId,
    required this.aufragVon,
    required this.tck,
    required this.datum,
    required this.arbeitsstelle,
    required this.durchzufuehrendeArbeit,
    required this.meldungExecutive,
    required this.stoerungsmeldung,
    required this.pruefung,
    required this.arbeitDurchgefuehrtAm,
    required this.arbeitDurchgefuehrtVon,
    required this.arbeitDurchgefuehrtBis,
    required this.namen,
    required this.arbeitFertig,
    required this.aufwand,
  });

  // Factory method to create a Report object from a JSON map
  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      reportId: json['reportId'],
      aufragVon: json['aufragVon'],
      tck: json['tck'],
      datum: DateTime.parse(json['datum']),
      arbeitsstelle: json['arbeitsstelle'],
      durchzufuehrendeArbeit: json['durchzufuehrendeArbeit'],
      meldungExecutive: json['meldungExecutive'],
      stoerungsmeldung: json['stoerungsmeldung'],
      pruefung: Pruefung.values.firstWhere(
              (value) => value.toString() == 'Pruefung.${json['pruefung']}'),
      arbeitDurchgefuehrtAm: DateTime.parse(json['arbeitDurchgefuehrtAm']),
      arbeitDurchgefuehrtVon: DateTime.parse(json['arbeitDurchgefuehrtVon']),
      arbeitDurchgefuehrtBis: DateTime.parse(json['arbeitDurchgefuehrtBis']),
      namen: (json['namen'] as List<dynamic>)
          .map((userJson) => User.fromJson(userJson))
          .toList(),
      arbeitFertig: json['arbeitFertig'],
      aufwand: json['aufwand'],
    );
  }

  // Convert Report object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'reportId': reportId,
      'aufragVon': aufragVon,
      'tck': tck,
      'datum': datum.toIso8601String(),
      'arbeitsstelle': arbeitsstelle,
      'durchzufuehrendeArbeit': durchzufuehrendeArbeit,
      'meldungExecutive': meldungExecutive,
      'stoerungsmeldung': stoerungsmeldung,
      'pruefung': describeEnum(pruefung),
      'arbeitDurchgefuehrtAm': arbeitDurchgefuehrtAm.toIso8601String(),
      'arbeitDurchgefuehrtVon': arbeitDurchgefuehrtVon.toIso8601String(),
      'arbeitDurchgefuehrtBis': arbeitDurchgefuehrtBis.toIso8601String(),
      'namen': namen.map((user) => user.toJson()).toList(),
      'arbeitFertig': arbeitFertig,
      'aufwand': aufwand,
    };
  }
}
