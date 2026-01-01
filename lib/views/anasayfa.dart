import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi_state_management/cubit/anasayfa_cubit.dart';
import 'package:kisiler_uygulamasi_state_management/entity/Kisiler.dart';
import 'package:kisiler_uygulamasi_state_management/views/kisi_detay_sayfa.dart';
import 'package:kisiler_uygulamasi_state_management/views/kisi_kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle(); // ilk başta bu metod çalışması için
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: aramaYapiliyorMu ?
            TextField(decoration: const InputDecoration(
              hintText: "Ara"),
              onChanged: (aramaSonucu){
              context.read<AnasayfaCubit>().ara(aramaSonucu);
              },
            ) :
        Text("Anasayfa"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false;
              context.read<AnasayfaCubit>().kisileriYukle();
            });
          },
              icon: Icon(Icons.cancel)
          ):
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });
          },
              icon: Icon(Icons.search)
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body:BlocBuilder<AnasayfaCubit,List<Kisiler>>(
          builder: (context,kisilerListesi){
            if(kisilerListesi.isNotEmpty){
              return ListView.builder(
                itemCount: kisilerListesi.length,
                  itemBuilder:(context,index){
                      var kisi = kisilerListesi[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>KisiDetaySayfa(kisi: kisi)))
                          .then((value){ context.read<AnasayfaCubit>().kisileriYukle();});
                          },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${kisi.kisi_ad} - ${kisi.kisi_tel}"),
                                IconButton(
                                    onPressed:(){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("${kisi.kisi_ad} silinsin mi?",style: TextStyle(fontSize: 15),),
                                          action: SnackBarAction(
                                              label: "EVET",
                                              onPressed:(){
                                                context.read<AnasayfaCubit>().sil(kisi.kisi_id);
                                              }),
                                          ),
                                        );
                                      },
                                    icon: Icon(Icons.delete,color: Colors.black54,)),

                              ],
                            ),
                          ),
                        ),
                      );
                  }
              );
            }else{
              return const Center();
            }
          },

      ),



      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const KisiKayitSayfa()))
              .then((value){
              context.read<AnasayfaCubit>().kisileriYukle();
          });
        },
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
