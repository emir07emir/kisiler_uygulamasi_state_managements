import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi_state_management/entity/Kisiler.dart';
import 'package:kisiler_uygulamasi_state_management/sqlite/veritabani_yardimcisi.dart';

class KisilerDaoRepository{

  var refKisiler = FirebaseDatabase.instance.ref().child("kisiler");

  Future<void>kisiKayit(String kisi_ad,String kisi_tel)async{
    // var db =await VeritabaniYardimcisi.veritabaniErisim();
    // var bilgiler = Map<String,dynamic>();
    // bilgiler["kisi_ad"] = kisi_ad;            //veritabanı
    // bilgiler["kisi_tel"] = kisi_tel;
    // await db.insert("kisiler", bilgiler);


    var bilgi = Map<String,dynamic>();
    bilgi["kisi_id"] = "";
    bilgi["kisi_ad"] = kisi_ad;
    bilgi["kisi_tel"] = kisi_tel;
    refKisiler.push().set(bilgi);




  }

  Future <void> kisiGuncelle(String kisi_id, String kisi_ad, String kisi_tel) async{
    // var db =await VeritabaniYardimcisi.veritabaniErisim();
    // var bilgiler = Map<String,dynamic>();
    // bilgiler["kisi_id"] = kisi_id;
    // bilgiler["kisi_ad"] = kisi_ad;          //todo veritabanı için
    // bilgiler["kisi_tel"] = kisi_tel;
    // await db.update("kisiler",bilgiler, where: "kisi_id = ?",whereArgs: [kisi_id]);


    var bilgi = Map<String,dynamic>();
    bilgi["kisi_ad"] = kisi_ad;
    bilgi["kisi_tel"] = kisi_tel;
    refKisiler.child(kisi_id).update(bilgi);












  }

  // Future<List<Kisiler>> tumKisileriAl() async{
  //   var db =await VeritabaniYardimcisi.veritabaniErisim();
  //   List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler");
  //
  //   return List.generate(maps.length, (index){
  //     var satir = maps[index];
  //     return Kisiler(kisi_id: satir["kisi_id"],kisi_ad: satir["kisi_ad"],kisi_tel: satir["kisi_tel"]);
  //   });
  // }

  // Future<List<Kisiler>> kisiAra(String aramaKelimesi) async {
  //   var db = await VeritabaniYardimcisi.veritabaniErisim();
  //   List<Map<String, dynamic>> maps = await db.rawQuery(
  //       "SELECT * FROM kisiler WHERE kisi_ad like '%$aramaKelimesi'");
  //
  //   return List.generate(maps.length, (index) {
  //     var satir = maps[index];                            //todo veritabanı için kullanıldı. firebasede ise bu kısım anasayfa_cubit.dart a alındı
  //     return Kisiler(kisi_id: satir["kisi_id"],
  //         kisi_ad: satir["kisi_ad"],
  //         kisi_tel: satir["kisi_tel"]);
  //   });
  // }




    Future <void> kisiSil(String kisi_id) async {
      // var db = await VeritabaniYardimcisi.veritabaniErisim();
      // await db.delete("kisiler", where: "kisi_id=?",
      //     whereArgs: [                                   //todo veritabanı için
      //       kisi_id
      //     ]); // ? işareti yerine ne geleceğini whereArgs ile belirlemiş oluyoruz





      var bilgi = Map<String,dynamic>();
      refKisiler.child(kisi_id).remove();









  }
  }