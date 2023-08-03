import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../model/report.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final Report _report = Report.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEUEN ARBEITSSCHEIN ERSTELLEN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'aufragVon',
                  decoration: const InputDecoration(labelText: 'Aufrag Von'),
                  validator: FormBuilderValidators.required(),
                  onChanged: (value) {
                    _report.aufragVon = value!;
                  },
                ),
                FormBuilderTextField(
                  name: 'tck',
                  decoration: const InputDecoration(labelText: 'TCK'),
                  validator: FormBuilderValidators.required(),
                  onChanged: (value) {
                    _report.tck = value!;
                  },
                ),
                FormBuilderDateTimePicker(
                  name: 'datum',
                  decoration: const InputDecoration(labelText: 'Datum'),
                  initialDate: DateTime.now(),
                  onChanged: (value) {
                    _report.datum = value!;
                  },
                ),
                FormBuilderTextField(
                  name: 'arbeitsstelle',
                  decoration: InputDecoration(labelText: 'Arbeitsstelle'),
                  validator: FormBuilderValidators.required(),
                  onChanged: (value) {
                    _report.arbeitsstelle = value!;
                  },
                ),
                FormBuilderTextField(
                  name: 'durchzufuehrendeArbeit',
                  decoration:
                  InputDecoration(labelText: 'Durchzuführende Arbeit'),
                  validator: FormBuilderValidators.required(),
                  onChanged: (value) {
                    _report.durchzufuehrendeArbeit = value!;
                  },
                ),
                FormBuilderSwitch(
                  name: 'meldungExecutive',
                  title: Text('Meldung Executive'),
                  onChanged: (value) {
                    _report.meldungExecutive = value!;
                  },
                ),
                FormBuilderTextField(
                  name: 'stoerungsmeldung',
                  decoration: const InputDecoration(labelText: 'Störungsmeldung'),
                  validator: FormBuilderValidators.required(),
                  onChanged: (value) {
                    _report.stoerungsmeldung = value!;
                  },
                ),
                FormBuilderRadioGroup<Pruefung>(
                  name: 'pruefung',
                  decoration: const InputDecoration(labelText: 'Prüfung'),
                  initialValue: Pruefung.stoerungsbehebung,
                  onChanged: (value) {
                    _report.pruefung = value!;
                  },
                  options: const [
                    FormBuilderFieldOption(
                      value: Pruefung.stoerungsbehebung,
                      child: Text('Störungsbehebung'),
                    ),
                    FormBuilderFieldOption(
                      value: Pruefung.hauptpruefung,
                      child: Text('Hauptprüfung'),
                    ),
                  ],
                ),
                FormBuilderDateTimePicker(
                  name: 'arbeitDurchgefuehrtAm',
                  decoration:
                  const InputDecoration(labelText: 'Arbeit durchgeführt am'),
                  initialDate: DateTime.now(),
                  onChanged: (value) {
                    _report.arbeitDurchgefuehrtAm = value!;
                  },
                ),
                FormBuilderDateTimePicker(
                  name: 'arbeitDurchgefuehrtVon',
                  decoration: const InputDecoration(labelText: 'Arbeit durchgeführt von'),
                  inputType: InputType.time, // Set inputType to time
                  onChanged: (value) {
                    _report.arbeitDurchgefuehrtVon = value!;
                  },
                ),
                FormBuilderDateTimePicker(
                  name: 'arbeitDurchgefuehrtBis',
                  decoration: const InputDecoration(labelText: 'Arbeit durchgeführt bis'),
                  inputType: InputType.time, // Set inputType to time
                  onChanged: (value) {
                    _report.arbeitDurchgefuehrtBis = value!;
                  },
                ),
                // FormBuilderTextField for 'namen' is omitted as it requires more complex logic to handle the list of users.

                FormBuilderSwitch(
                  name: 'arbeitFertig',
                  title: const Text('Arbeit Fertig'),
                  onChanged: (value) {
                    _report.arbeitFertig = value!;
                  },
                ),
                FormBuilderTextField(
                  name: 'aufwand',
                  decoration: const InputDecoration(labelText: 'Gesamtaufwand'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                  ]),
                  onChanged: (value) {
                    _report.aufwand = double.parse(value!);
                  },
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        // Here, you can do something with the filled report data
                        // For example, you can print the report details:
                        if (kDebugMode) {
                          print(_report.toJson());
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Arbeitsbericht abgegeben'),
                          ),
                        );
                        _formKey.currentState?.reset();
                      }
                    },
                    child: const Text('Hinzufügen'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}