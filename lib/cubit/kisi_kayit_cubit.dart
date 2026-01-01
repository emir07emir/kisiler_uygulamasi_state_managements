import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi_state_management/cubit/anasayfa_cubit.dart';
import 'package:kisiler_uygulamasi_state_management/repo/kisilerdao_repository.dart';

class KisiKayitCubit extends Cubit<void>{
  KisiKayitCubit() : super(0);

  var kRepo = KisilerDaoRepository();

  Future<void>Kayit(String kisi_ad,String kisi_tel)async{
    await kRepo.kisiKayit(kisi_ad, kisi_tel);
    await AnasayfaCubit().kisileriYukle();
  }
}