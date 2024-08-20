class AuthValidator {
  // E-posta doğrulama fonksiyonu
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen bir e-posta girin.';
    }
    if (!value.contains('@')) {
      return 'Geçerli bir e-posta adresi girin.';
    }
    return null;
  }

  // Şifre doğrulama fonksiyonu
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen bir şifre girin.';
    }
    if (value.length < 6) {
      return 'Şifre en az 6 karakter olmalı.';
    }
    return null;
  }
}
