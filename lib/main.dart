import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:sharfin_app/bloc/ayat_bloc.dart';
import 'package:sharfin_app/cubit/Surat/surat_cubit.dart';
import 'package:sharfin_app/data/api_service.dart';
import 'package:sharfin_app/view/ebooks.dart';
import 'package:sharfin_app/view/homepage.dart';
import 'package:sharfin_app/view/islamicFeature.dart';
import 'package:sharfin_app/view/onBoarding.dart';
import 'package:sharfin_app/view/splashScreen.dart';
import 'package:sharfin_app/view/test.dart';
import 'package:sharfin_app/widget/bottomNavigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SuratCubit(
            ApiService(
              client: http.Client(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => AyatBloc(
            ApiService(
              client: http.Client(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash', // Set your default initial route here
        routes: {
          '/home': (context) => const bottomNavigation(
                selectedIndex: 0,
              ),
          '/splash': (context) => const onboarding(),
          '/ebook': (context) => ebooks()
        },
        theme: ThemeData(
          fontFamily: 'Poppins',
          useMaterial3: true,
          colorSchemeSeed: const Color(0XFF15AC97),
        ),
      ),
    );
  }
}
