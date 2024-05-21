import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:sharfin_app/util/My_navbar.dart';
import 'package:sharfin_app/view/test.dart';
=======
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sharfin_app/bloc/ayat_bloc.dart';
import 'package:sharfin_app/cubit/Surat/surat_cubit.dart';
import 'package:sharfin_app/data/api_service.dart';
<<<<<<< Updated upstream
import 'package:sharfin_app/view/others/splashScreen.dart';
import 'package:http/http.dart' as http;
=======
import 'package:sharfin_app/view/homepage.dart';
import 'package:sharfin_app/view/islamicFeature.dart';
import 'package:sharfin_app/view/onBoarding.dart';
import 'package:sharfin_app/view/semuaMenuPage.dart';
import 'package:sharfin_app/view/splashScreen.dart';
import 'package:sharfin_app/view/test.dart';
import 'package:sharfin_app/widget/bottomNavigation.dart';
>>>>>>> Stashed changes

>>>>>>> Stashed changes
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomScaffold(),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color(0XFF14B5AE),
=======
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SuratCubit(
            ApiService(
              client: http.Client(),
            ),
          ),
        ),
        // BlocProvider<AyatCubit>(
        //   create: (context) => AyatCubit(
        //     ApiService(
        //       client: http.Client(),
        //     ),
        //   ),
        // ),
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
<<<<<<< Updated upstream
        home: FutureBuilder(  
          builder: (context, snapshot) {
            if (hasPermission) {
              return SplashScreen();
            } else {    
              return const Scaffold(
                backgroundColor: Color.fromARGB(255, 48, 48, 48),
              );
            }
          },
          future: getPermission(),),
=======
        initialRoute: initialRoute,
        routes: {
          '/home': (context) => HomePage(),
          '/splash': (context) => const onboarding(),
          // Add other routes here if needed
        },
>>>>>>> Stashed changes
        theme: ThemeData(
          fontFamily: 'Poppins',
          useMaterial3: true,
          colorSchemeSeed: Color(0XFF15AC97),
        ),
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
      //   title: 'Button API Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: HomePage(),
>>>>>>> Stashed changes
      ),
    );
  }
}
