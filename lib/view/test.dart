import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class EbookContent1 extends StatefulWidget {
  final String ebookUrl;

  const EbookContent1({Key? key, required this.ebookUrl}) : super(key: key);

  @override
  _EbookContent1State createState() => _EbookContent1State();
}

class _EbookContent1State extends State<EbookContent1> {
  String? localFilePath;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    downloadFile(widget.ebookUrl);
  }

  Future<void> downloadFile(String url) async {
    try {
      Dio dio = Dio();
      var dir = await getApplicationDocumentsDirectory();
      String filePath = '${dir.path}/ebook.pdf';

      await dio.download(url, filePath);
      setState(() {
        localFilePath = filePath;
        isLoading = false;
      });
    } catch (e) {
      print("Error downloading file: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Baca Ebook',
          style: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF14142B),
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: localFilePath,
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: false,
              pageFling: false,
              onRender: (_pages) {
                setState(() {});
              },
              onError: (error) {
                print(error.toString());
              },
              onPageError: (page, error) {
                print('$page: ${error.toString()}');
              },
            ),
    );
  }
}
