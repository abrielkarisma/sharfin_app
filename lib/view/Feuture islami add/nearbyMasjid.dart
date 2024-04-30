import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NearbyMasjid extends StatefulWidget {
  static const List<Map<String, dynamic>> categories = [
    {
      'items': [
        {'title': 'Masjid As Syuhada', 'text': '150m'},
        {'title': 'Masjid Al Ikhlas', 'text': '1.50km'},
        {'title': 'Masjid Istiqlal', 'text': '2.50km'},
        {'title': 'Masjid Al Amin', 'text': '2.74km'},
        {'title': 'Masjid Jami Malik', 'text': '3.24km'},
      ],
    },
  ];

  const NearbyMasjid({super.key});

  @override
  State<NearbyMasjid> createState() => _NearbyMasjidState();
}

class _NearbyMasjidState extends State<NearbyMasjid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Masjid Terdekat',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: NearbyMasjid.categories[0]['items'].length,
        itemBuilder: (context, index) {
          final item = NearbyMasjid.categories[0]['items'][index];
          return MosqueItem(
            title: item['title'],
            distance: item['text'],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MosqueDetailsPage(mosqueName: item['title'])),
              );
            },
          );
        },
      ),
    );
  }
}

class MosqueItem extends StatelessWidget {
  final String title;
  final String distance;
  final VoidCallback onTap;

  const MosqueItem({
    Key? key,
    required this.title,
    required this.distance,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        child: ListTile(
          tileColor: Colors.white,
          title: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            distance,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xffa0a3bd),
            ),
          ),
          trailing: SvgPicture.asset('assets/LocMark.svg', width: 24, height: 24,),
        ),
      ),
    );
  }
}

class MosqueDetailsPage extends StatelessWidget {
  final String mosqueName;

  const MosqueDetailsPage({Key? key, required this.mosqueName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mosqueName),
      ),
      body: Center(
        child: Text('Details of $mosqueName'),
      ),
    );
  }
}
