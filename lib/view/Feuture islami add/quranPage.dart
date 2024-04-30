import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sharfin_app/view/Feuture%20islami%20add/juzPage.dart';
import 'package:sharfin_app/view/Feuture%20islami%20add/suraPage.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Al Quran',
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
      body: DefaultTabController(
        length: 2,
        child: Center(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: _lastread(),
              ),
              const SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                elevation: 0,
                bottom: PreferredSize(preferredSize: Size.fromHeight(0),
                child: TabBar(
                  indicatorColor: Color(0xff15ac97),
                  indicatorWeight: 1,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Color(0xff15ac97),
                  tabs: [
                  Tab(child: Text('Juz',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),),
                  Tab(child: Text('Surat', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),),
                  
                ],)
                  ),
                  ),
            ],
            body: TabBarView(
              children: [
                JuzPage(),
                SuratPage(),
                
              ],
            )
          ),
        ),
      ),
    );
  }

  Column _lastread() {
    return Column(
      children: [
        SizedBox(height: 16),
        Stack(
          children: [
            Container(
              height: 131,
              width: 343,
              decoration: BoxDecoration(
                color: Color(0xff15ac97),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset('assets/Circle.svg'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset('assets/book.svg'),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terakhir Dibaca',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 29),
                  Text(
                    'Al-fatihah',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Ayat 1',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
