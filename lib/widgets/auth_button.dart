// import 'package:flutter/material.dart';

// class AuthButton extends StatelessWidget {
//   const AuthButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         // Form doğrulama işlemimiz
//         if (_formKeyRegister.currentState?.validate() ?? false) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Giriş başarılı!')),
//           );
//         }
//       },
//       style: ElevatedButton.styleFrom(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 50,
//           vertical: 15,
//         ),
//         foregroundColor: Colors.black,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//       ),
//       child: Text(
//         AppStrings().register,
//         style: const TextStyle(fontSize: 18),
//       ),
//     );
//   }
// }
