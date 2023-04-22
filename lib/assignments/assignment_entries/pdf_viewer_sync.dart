import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatelessWidget {
  const PdfViewer({super.key,});
  @override
  Widget build(BuildContext context) {
    PdfViewerController pdfController = PdfViewerController();
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("PDF Viewer"), actions: <Widget>[
        IconButton(onPressed: () {pdfController.zoomLevel += 1.25;}, icon: Icon(Icons.zoom_in, color: Colors.white,))
      ],),
      body: SfPdfViewer.network(
        "https://www.africau.edu/images/default/sample.pdf",
        controller: pdfController,),
    ));
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PdfViewer(),
    );
  }
}