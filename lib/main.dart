import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharfin_app/bloc/ayat_bloc.dart';
import 'package:sharfin_app/cubit/Surat/surat_cubit.dart';
import 'package:sharfin_app/data/api_service.dart';
import 'package:sharfin_app/view/homepage.dart';
import 'package:sharfin_app/view/islamicFeature.dart';
import 'package:sharfin_app/view/onBoarding.dart';
import 'package:sharfin_app/view/splashScreen.dart';
import 'package:sharfin_app/widget/bottomNavigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final String initialRoute = await determineInitialRoute();
  runApp(MyApp(initialRoute: initialRoute));
}

Future<String> determineInitialRoute() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  return token != null ? '/home' : '/splash';
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

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
        initialRoute: initialRoute,
        routes: {
          '/home': (context) => const bottomNavigation(
                selectedIndex: 0,
              ),
          '/splash': (context) => const onboarding(),
          // Add other routes here if needed
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
