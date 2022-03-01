import 'package:flutter/material.dart';
import 'package:flutter_lifecycle/center_data_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  int? _a;
  String? _text;

  @override
  void initState() {
    super.initState();
    _a = 11;
    _text = 'Temp Data';
    changeTextData();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Second' + _a.toString());
  }

  void changeTextData() async {
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      _text = 'New Data';
      _a = 10;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if (state == AppLifecycleState.inactive) {
        print("Lifecycle: inactive");
      }
      if (state == AppLifecycleState.resumed) {
        print("Lifecycle: Resumed");
      }
      if (state == AppLifecycleState.paused) {
        print("Lifecycle: Paused");
      }
    }); //setState
  } //didCh

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StatefulWidget lifecycle')),
      body: Center(
        child: CenterDataText(text: _text, number: _a),
      ),
    );
  }
}
