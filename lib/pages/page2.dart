// Dependencies
import 'package:flutter/material.dart';
// import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// import 'dart:async';
// import 'dart:io';

// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKeyNetwork = GlobalKey();
  final GlobalKey<SfPdfViewerState> _pdfViewerKeyAsset = GlobalKey();

  bool showPdf = false;
  bool showPdf2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                  child: const Text("Open PDF Network"),
                  onPressed: () {
                    setState(() {
                      showPdf = true;
                    });
                  }),
              ElevatedButton(
                  child: const Text("Open Bookmark View"),
                  // onPressed: loadPdf,
                  onPressed: () {
                    _pdfViewerKeyNetwork.currentState?.openBookmarkView();
                  }),
              ElevatedButton(
                  child: const Text("Open PDF Asset"),
                  onPressed: () {
                    setState(() {
                      showPdf2 = true;
                    });
                  }),
              if (showPdf)
                Expanded(
                  child: SfPdfViewer.network(
                    'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                    key: _pdfViewerKeyNetwork,
                  ),
                ),
              if (showPdf2)
                Expanded(
                  child: SfPdfViewer.asset(
                    'assets/doc.pdf',
                    key: _pdfViewerKeyAsset,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
