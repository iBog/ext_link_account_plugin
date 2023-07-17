import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ext_link_account_plugin/ext_link_account_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _canMakePayments = 'Unknown';
  String _canOpenExt = 'Unknown';
  final _extLinkAccountPlugin = ExtLinkAccountPlugin();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    bool? canMakePayments;
    bool? canOpenExt;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _extLinkAccountPlugin.getPlatformVersion() ?? 'Unknown platform version';
      canMakePayments =  await _extLinkAccountPlugin.canMakePayments();
      canOpenExt =  await _extLinkAccountPlugin.canOpenExternalLinkAccount();
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _canMakePayments = canMakePayments?.toString()??'N/A';
      _canOpenExt = canOpenExt?.toString()??'N/A';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("'External Link Account' Plugin example app"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Running on: $_platformVersion\n'),
              Text('Can open External Link Account: $_canOpenExt\n'),
              Text('Can make payments: $_canMakePayments\n'),
            ],
          ),
        ),
      ),
    );
  }
}
