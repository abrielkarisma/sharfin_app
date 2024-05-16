import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sharfin_app/bloc/ayat_bloc.dart';
import 'package:sharfin_app/cubit/Surat/surat_cubit.dart';
import 'package:sharfin_app/data/api_service.dart';
import 'package:sharfin_app/view/onBoarding.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasPermission = false;

  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission = true;
      } else {
        Permission.location.request().then((value) {
          setState(() {
            hasPermission = (value == PermissionStatus.granted);
          });
        });
      }
    }
  }

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
        home: FutureBuilder(
          builder: (context, snapshot) {
            if (hasPermission) {
              return const onboarding();
            } else {
              return const Scaffold(
                backgroundColor: Color.fromARGB(255, 48, 48, 48),
              );
            }
          },
          future: getPermission(),
        ),
        theme: ThemeData(
          fontFamily: 'Poppins',
          useMaterial3: true,
          colorSchemeSeed: const Color(0XFF15AC97),
        ),
      ),
    );
  }
}
