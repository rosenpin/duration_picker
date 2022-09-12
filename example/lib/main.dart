import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Duration Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Duration Picker Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Duration _duration = const Duration(hours: 0, minutes: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: DurationPicker(
              duration: _duration,
              baseUnit: BaseUnit.minute,
              onChange: (val) {
                setState(() => _duration = val);
              },
              snapToMins: 15.0,
            ))
          ],
        ),
      ),
      floatingActionButton: Builder(
          builder: (BuildContext context) => FloatingActionButton(
                onPressed: () async {
                  var resultingDuration = await showDurationPicker(
                    context: context,
                    initialTime: const Duration(minutes: 30),
                    snapToMins: 15,
                    baseUnit: BaseUnit.minute,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Chose duration: $resultingDuration')));
                },
                tooltip: 'Popup Duration Picker',
                child: const Icon(Icons.add),
              )),
    );
  }
}
