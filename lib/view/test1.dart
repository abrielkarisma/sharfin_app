import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

class PdfViewPage extends StatefulWidget {
  final String pdfUrl;

  PdfViewPage({required this.pdfUrl});

  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  late String localPath = '';

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      var filePath = p.join(dir.path, p.basename(widget.pdfUrl));

      if (File(filePath).existsSync()) {
        setState(() {
          localPath = filePath;
        });
      } else {
        await Dio().download(widget.pdfUrl, filePath);
        setState(() {
          localPath = filePath;
        });
      }
    } catch (e) {
      print('Error loading PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF View'),
      ),
      body: localPath.isNotEmpty
          ? PDFView(
              filePath: localPath,
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
