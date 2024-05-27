import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharfin_app/bloc/ayat_bloc.dart';
import 'package:sharfin_app/cubit/Surat/surat_cubit.dart';
import 'package:sharfin_app/data/api_service.dart';
import 'package:sharfin_app/view/ebooks.dart';
import 'package:sharfin_app/view/homepage.dart';
import 'package:sharfin_app/view/splashScreen.dart';
import 'package:sharfin_app/widget/bottomNavigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);

  // Periksa apakah terdapat token di SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasToken = prefs.getString('token') != null;

  // Tentukan rute awal berdasarkan keberadaan token
  String initialRoute = hasToken ? '/home' : '/splash';

  runApp(MyApp(initialRoute: initialRoute));
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
        initialRoute: initialRoute, // Gunakan rute awal yang ditentukan
        routes: {
          '/home': (context) => const bottomNavigation(
                selectedIndex: 0,
              ),
          '/splash': (context) => const splashScreen(),
          // Tambahkan rute lain yang diperlukan di sini
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
