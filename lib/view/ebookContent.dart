import 'package:flutter/material.dart';
import 'package:sharfin_app/data/models/Ebook.dart';
import 'package:sharfin_app/data/service/Ebook.dart';

class ebookContent extends StatefulWidget {
  final String id;

  const ebookContent({super.key, required this.id});

  @override
  State<ebookContent> createState() => _ebookContentState();
}

class _ebookContentState extends State<ebookContent> {
  Ebook? ebook;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    final ebookService = EbookService();
    _fetchData(ebookService, widget.id);
  }

  Future<void> _fetchData(EbookService ebookService, String id) async {
    try {
      Ebook? result = await ebookService.getEbook(id);
      setState(() {
        ebook = result;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching data: $e");
      setState(() {
        isLoading = false;
      });
      // Handle error appropriately (e.g., display an error message)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: isLoading
              ? const CircularProgressIndicator()
              : Column(
                  children: [
                    Stack(children: [
                      SizedBox(
                          width: 415,
                          height: 519,
                          child:
                              Image.network(ebook!.image, fit: BoxFit.cover)),
                      Container(
                        padding: const EdgeInsets.only(left: 16, top: 60),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          ebook != null
                              ? ebook!.content +
                                  ebook!.content +
                                  ebook!.content +
                                  ebook!.content
                              : "",
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF14142B),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
