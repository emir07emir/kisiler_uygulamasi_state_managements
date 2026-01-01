import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi_state_management/cubit/anasayfa_cubit.dart';
import 'package:kisiler_uygulamasi_state_management/cubit/kisi_detay_cubit.dart';
import 'package:kisiler_uygulamasi_state_management/cubit/kisi_kayit_cubit.dart';
import 'package:kisiler_uygulamasi_state_management/views/anasayfa.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>KisiKayitCubit()),
        BlocProvider(create: (context)=>KisiDetayCubit()),
        BlocProvider(create: (context)=>AnasayfaCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Anasayfa(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();





  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin { // animasyon işlemlerini yapabilmemiz için

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(),
    );
  }
}
