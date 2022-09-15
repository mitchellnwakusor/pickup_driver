import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pickup_driver/screens/home.dart';
import 'package:pickup_driver/screens/login.dart';
import 'package:pickup_driver/screens/signup.dart';
import 'package:pickup_driver/screens/splash_screen.dart';
import 'package:pickup_driver/screens/verify_otp.dart';
import 'package:pickup_driver/services/firebase_services.dart';
import 'package:pickup_driver/services/providers.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const JourneyMan());
}

class JourneyMan extends StatelessWidget {
  const JourneyMan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => Providers()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/' : (context) => const SplashScreen(),
          '/home' : (context) => const HomeScreen(),
          '/signup' : (context) => const SignupScreen(),
          '/login' : (context) => const LoginScreen(),
          '/otpverification' : (context) => const VerifyOTP(),

        },
      ),
    );
  }
}