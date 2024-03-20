// ignore_for_file: prefer_const_constructors

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";
import "package:sharfin_app/util/My_button.dart";
import "package:sharfin_app/util/My_card.dart";


class HomePage extends StatefulWidget{
  const HomePage({Key? key }) : super(key:key);
  

  @override 
  State<HomePage> createState() => _HomePageState();
  
}
  class _HomePageState extends State<HomePage> {
    final List<Map<String, dynamic>> insights = [
    {
      'image': 'https://via.placeholder.com/150',
    },
    {
      'image': 'https://via.placeholder.com/150',
    },
    {
      'image': 'https://via.placeholder.com/150',
    },
    
  ];

    bool _obsecureText = true;
    final _controller = PageController();

  void toogleVisibility() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

    @override 
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Color.fromARGB(65, 222, 222, 222),
        body: SingleChildScrollView(
          child: SafeArea (
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                            "Assalamualaikum", 
                            style: TextStyle(fontSize: 16,color: Colors.grey[500],), 
                            ),
                              Text(
                            "Ammar", 
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
          
                        Icon(Icons.notifications_outlined,size: 36,),
                      ],
                      )
                ),
                  SizedBox(height: 25,),

                  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: Color(0xff15ac97), borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Saldo Saya", style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w500, color: Colors.white)),
              ],
            ),
           TextFormField(
              initialValue: '23456', // Replace with actual balance value
              obscureText: _obsecureText, // Toggle visibility based on state
              readOnly: true,
              style: TextStyle(color: Colors.white), // Make the field read-only
              decoration: InputDecoration(
                iconColor: Colors.white,
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obsecureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: toogleVisibility,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Color(0xff887aa6).withOpacity(0.12), blurRadius: 56, spreadRadius: 10, offset: Offset(0.0, 13.0))],
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.85),
                    Color(0xffb1f1df),
              ],
            ), ),
              child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  print("container pressed");
                },
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 45,
                          margin: EdgeInsets.symmetric(horizontal:14),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration( color: Colors.transparent, borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.white),),
                          child: Icon(Icons.account_balance_wallet_outlined, color:Color(0xff15ac97) ,),      
                          ),
                          SizedBox(height: 5,),
                          Text("Top up", style:TextStyle(fontSize: 12,),)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 45,
                          margin: EdgeInsets.symmetric(horizontal: 14),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration( color: Colors.transparent, borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.white)),
                          child: Icon(Icons.swap_horiz_outlined, color:Color(0xff15ac97) ,)      
                          ),
                          SizedBox(height: 5,),
                          Text("Transfer", style: TextStyle(fontSize: 12),)
                      ],
                    ),
                      Column(
                        children: [
                          Container(
                          height: 45,
                          margin: EdgeInsets.symmetric(horizontal: 14),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration( color: Colors.transparent, borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.white)),
                          child: Icon(Icons.arrow_downward_outlined, color:Color(0xff15ac97) ,)      
                          ),
                          SizedBox(height: 5,),
                          Text("Tarik Tunai", style: TextStyle(fontSize: 12),)
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                          height: 45,
                          margin: EdgeInsets.symmetric(horizontal: 14),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration( color: Colors.transparent, borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.white)),
                          child: Icon(Icons.history, color:Color(0xff15ac97) ,)       
                          ),
                          SizedBox(height: 5,),
                          Text("Mutasi", style: TextStyle(fontSize:12))
                        ],
                      ),
                  ],
                ),
                  
              ),
              ],
            ),
            ),
            ],),
      ),
    ),
           SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(13),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Row(children: [ 
                            MyButton(
                              iconImagePath:"assets/paket_data.png" ,
                              buttonText: "Pulsa & Paket",
                            ),
                             MyButton(
                              iconImagePath:"assets/Internet.png" ,
                              buttonText: "Internet",
                            ),
                             MyButton(
                              iconImagePath:"assets/pln.png" ,
                              buttonText: "PLN",
                            ),
                             MyButton(
                              iconImagePath:"assets/pdam.png" ,
                              buttonText: "PDAM",
                            ),
                          ],),
                          SizedBox(height: 20,),
                          Row(children: [ 
                            MyButton(
                              iconImagePath:"assets/tiket kereta.png" ,
                              buttonText: "Tiket Kereta",
                            ),
                             MyButton(
                              iconImagePath:"assets/e-commerce.png" ,
                              buttonText: "E-Commerce",
                            ),
                             MyButton(
                              iconImagePath:"assets/islami.png" ,
                              buttonText: "Fitur Islami",
                            ),
                             MyButton(
                              iconImagePath:"assets/lainnya.png" ,
                              buttonText: "lainnya",
                            ),
                          ],),
                          
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25,),

                   Container( 
                    height: 200,
                    child: 
                    PageView(
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      children: [
                    MyCard(
                      iconImagePath: "assets/Image.png",
                    ),
                    MyCard(
                      iconImagePath: "assets/Image2.png",
                    ),
                    MyCard(
                      iconImagePath: "assets/Promo.png",
                    ),

                  ],),
                  ),
                  SizedBox(height:25),

     SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Insights:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  for (Map<String, dynamic> insight in insights)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          // Handle insight tap
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 125,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(insight['image']),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),

      SizedBox(height: 10,),
      SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Reels:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  for (Map<String, dynamic> insight in insights)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          // Handle insight tap
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 103,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(insight['image']),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 10,),

      SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Ebook:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  for (Map<String, dynamic> insight in insights)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          // Handle insight tap
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 160,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(insight['image']),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),

      

                ],) ,
                ),
        ),
      );
    }
  }

  //test inshigt

  class InsightsPage extends StatelessWidget {
  final List<Map<String, dynamic>> insights = [
    {
      'title': 'Insight 1',
      'image': 'https://via.placeholder.com/150',
      'description': 'Flutter is a UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.',
    },
    {
      'title': 'Insight 2',
      'image': 'https://via.placeholder.com/150',
      'description': 'Dart is the programming language used by Flutter for developing applications with a focus on productivity and performance.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insights'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'All Insights:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            for (Map<String, dynamic> insight in insights)
              Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(insight['image']),
                  ),
                  title: Text(insight['title']),
                  subtitle: Text(insight['description']),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

