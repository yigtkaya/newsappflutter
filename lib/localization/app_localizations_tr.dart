import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get signIn => 'Giriş Yap';

  @override
  String get signInDescription =>
      'Bilgi edinmek için kolayca giriş yapın ve haberleri keşfedin';

  @override
  String get signInWithGoogle => 'Google ile giriş yap';

  @override
  String get signInWithFacebook => 'Facebook ile giriş yap';

  @override
  String get email => 'Email';

  @override
  String get password => 'Şifre';

  @override
  String get forgotPassword => 'Şifremi unuttum?';

  @override
  String get dontHaveAnAccount => 'Hesabın yok mu? ';

  @override
  String get signUp => 'Hesap oluştur';

  @override
  String get signUpDescription =>
      'Hesap oluşturmak ve daha kişiselleştirilmiş haberler almak için devam edin';

  @override
  String get forgotPasswordTitle => 'Şifremi unuttum?';

  @override
  String get forgotPasswordDescription => 'Email adresinizi giriniz';

  @override
  String get sendLink => 'Link gönder';

  @override
  String get aldreadyHaveAnAccount => 'Hesabın var mı? ';

  @override
  String get pleaseEnterPassword => 'Lütfen şifrenizi giriniz';

  @override
  String get aPasswordShouldBeAtLeast8Characters =>
      'Şifreniz en az 8 karakter olmalıdır';

  @override
  String get pleaseEnterEmail => 'Lütfen email adresinizi giriniz';

  @override
  String get pleaseEnterValidEmail => 'Lütfen geçerli bir email adresi giriniz';

  @override
  String get or => 'Ve ya';

  @override
  String get name => 'Adınız';

  @override
  String get pleaseEnterName => 'Lütfen adınızı giriniz';

  @override
  String get forgotPasswordSuccess =>
      'Şifre sıfırlama linki email adresinize gönderildi';

  @override
  String get getStarted => 'Başla';

  @override
  String get next => 'Sonraki';
}
