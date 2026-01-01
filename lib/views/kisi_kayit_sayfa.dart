import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi_state_management/cubit/kisi_kayit_cubit.dart';
import 'package:kisiler_uygulamasi_state_management/views/anasayfa.dart';

class KisiKayitSayfa extends StatefulWidget {
  const KisiKayitSayfa({super.key});

  @override
  State<KisiKayitSayfa> createState() => _KisiKayitSayfaState();
}

class _KisiKayitSayfaState extends State<KisiKayitSayfa> {
  var tfKisiAd = TextEditingController();
  var tfKisiTel = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kişi Kayıt"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                TextField(
                  controller:tfKisiAd,
                  decoration: InputDecoration(
                    hintText: "Kisi adı giriniz"
                  ),
                ),
              TextField(
                controller:tfKisiTel,
                decoration: InputDecoration(
                    hintText: "tel no giriniz"
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
                ),
                  onPressed: (){
                    context.read<KisiKayitCubit>().Kayit(tfKisiAd.text.trim(), tfKisiTel.text.trim());
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Anasayfa()));
                  },
                  child: Text("KAYDET",style: TextStyle(color: Colors.white,),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
