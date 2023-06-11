import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sany/services/auth/auth_services.dart';
import 'package:sany/services/cloud/storage/user_storage.dart';
import 'package:sany/views/adminView/main_admin_ui.dart';
import 'package:sany/views/authView/login.dart';
import 'package:flutter/services.dart';
import 'package:sany/views/authView/register.dart';
import 'package:sany/views/authView/verify_email.dart';
import 'package:sany/views/clientView/main_client.dart';
import 'package:sany/views/companyView/main_company.dart';

import 'constants/routes.dart';

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //Lock Device orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 74, 44, 156)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        verifyEmailRoute:(context) => const VerificationEmail(),
        mainAdminRoute:(context) => const MainAdminPage(),
        mainCompanyRoute:(context) => const MainCompanyPage(),
        mainClientRoute:(context) => const MainClientPage(),
      },
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  final firebaseCloudService = FirebaseCloudStorage();

  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialise(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('Error');
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;

            //? Verifier si le user est connecté
            if (user != null) {
              final role = firebaseCloudService.getRole(email: user.email);
              if (user.isEmailVerified ?? false) {
                if (role == 'admin') {
                  return const MainAdminPage();
                }else if(role == 'compagnie'){
                  return const MainCompanyPage();
                }else{
                  return const MainClientPage();
                }
              } else {
                return const VerificationEmail();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
