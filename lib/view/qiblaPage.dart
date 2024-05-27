import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

class KiblatPage extends StatefulWidget {
  const KiblatPage({super.key});

  @override
  State<KiblatPage> createState() => _QiblahScreenState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;

class _QiblahScreenState extends State<KiblatPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Arah Kiblat',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: FlutterQiblah.qiblahStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: Colors.black,
                    ));
              }

              final qiblahDirection = snapshot.data!;
              animation = Tween(
                      begin: begin,
                      end: (qiblahDirection.qiblah * (pi / 180) * -1))
                  .animate(_animationController!);
              begin = (qiblahDirection.qiblah * (pi / 180) * -1);
              _animationController!.forward(from: 0);

              return Center(
                child: Column(children: [
                  Text(
                    "${qiblahDirection.direction.toInt()}°",
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(
                      height: 300,
                      child: AnimatedBuilder(
                        animation: animation!,
                        builder: (context, child) => Transform.rotate(
                            angle: animation!.value,
                            child: Image.asset(
                              'assets/Qibla.png',
                              width: 200,
                              height: 200,
                            )),
                      )),
                  const Text(
                    'Lihat panah dengan icon Kabah untuk',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const Text('menghadap Kiblat',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
