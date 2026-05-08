import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
  ).then((_) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClockWebView(),
    );
  }
}

class ClockWebView extends StatefulWidget {
  const ClockWebView({super.key});

  @override
  State<ClockWebView> createState() => _ClockWebViewState();
}

class _ClockWebViewState extends State<ClockWebView> {
  String? _filePath;

  @override
  void initState() {
    super.initState();
    _prepareAssets();
  }

  Future<void> _prepareAssets() async {
    final dir = await getTemporaryDirectory();
    final assets = ['Axure_1/index.html', 'Axure_1/tick.mp3'];
    for (final asset in assets) {
      final bytes = await rootBundle.load(asset);
      final file = File('${dir.path}/$asset');
      await file.parent.create(recursive: true);
      await file.writeAsBytes(bytes.buffer.asUint8List());
    }
    setState(() {
      _filePath = '${dir.path}/Axure_1/index.html';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _filePath == null
          ? const SizedBox.shrink()
          : InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri('file://$_filePath'),
              ),
              initialSettings: InAppWebViewSettings(
                mediaPlaybackRequiresUserGesture: false,
                allowFileAccessFromFileURLs: true,
                allowUniversalAccessFromFileURLs: true,
                javaScriptEnabled: true,
              ),
            ),
    );
  }
}
