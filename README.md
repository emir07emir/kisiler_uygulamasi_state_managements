# 📱 Kişiler Uygulaması (Flutter + BLoC Cubit + Firebase)

Bu proje, Flutter ve Dart kullanılarak geliştirilmiş basit bir **Kişiler Yönetim Uygulaması**dır.  
Uygulamada state management için **BLoC Cubit**, backend ve veri saklama için **Firebase** kullanılmıştır.

Kullanıcılar;
- Kişi ekleyebilir
- Kişileri listeleyebilir
- Kişi bilgilerini güncelleyebilir
- Kişileri silebilir
- Kişiler arasında arama yapabilir

---

## 🚀 Kullanılan Teknolojiler

- **Flutter**
- **Dart**
- **flutter_bloc (Cubit)**
- **Firebase (Firestore)**
- **Material Design**

---

## 🧠 Mimari

Projede **BLoC (Cubit)** mimarisi kullanılmıştır.  
UI ve iş mantığı birbirinden ayrılmıştır.

- **View** → UI katmanı
- **Cubit** → İş mantığı ve state yönetimi
- **Entity (Model)** → Veri modeli
- **Repository** → Firebase işlemleri

---

## 📂 Ekranlar

### 🏠 Anasayfa
- Kişi listesi görüntülenir
- Arama yapılabilir
- Kişi silme işlemi yapılır
- Kişi detay sayfasına geçiş yapılır

### ➕ Kişi Kayıt Sayfası
- Yeni kişi ekleme
- Ad ve telefon bilgileri alınır

### ✏️ Kişi Detay Sayfası
- Var olan kişinin bilgileri görüntülenir
- Kişi bilgileri güncellenebilir

---

## 🔄 Yapılan İşlemler (CRUD)

| İşlem | Açıklama |
|------|---------|
| Create | Yeni kişi ekleme |
| Read | Kişi listesini görüntüleme |
| Update | Kişi bilgilerini güncelleme |
| Delete | Kişi silme |

---

## 🔍 Arama Özelliği

Anasayfada bulunan arama çubuğu sayesinde kişiler **isimlerine göre filtrelenebilir**.  
Arama işlemi Cubit üzerinden yönetilmektedir.

---

## 🔥 Firebase

- Veriler **Firebase Firestore** üzerinde tutulmaktadır
- Gerçek zamanlı veri güncelleme desteklenmektedir
- Kişi ekleme, silme ve güncelleme işlemleri Firebase üzerinden yapılır

---

## ▶️ Kurulum

1. Projeyi klonla:
```bash
git clone https://github.com/kullanici_adi/kisiler_uygulamasi_state_management.git
```
👨‍💻 Geliştirici
Emir
Flutter & Mobile Developer
Muğla Sıtkı Koçman Üniversitesi
Bilişim Sistemleri Mühendisliği
