import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pickup_driver/map/home_index.dart';
import 'package:pickup_driver/screens/add_payment_card.dart';
import 'package:pickup_driver/screens/add_profile_picture.dart';
import 'package:pickup_driver/screens/change_email.dart';
import 'package:pickup_driver/screens/change_number.dart';
import 'package:pickup_driver/screens/edit_profile_picture.dart';
import 'package:pickup_driver/screens/home.dart';
import 'package:pickup_driver/screens/login.dart';
import 'package:pickup_driver/screens/profile.dart';
import 'package:pickup_driver/screens/reset_password.dart';
import 'package:pickup_driver/screens/settings.dart';
import 'package:pickup_driver/screens/signup.dart';
import 'package:pickup_driver/screens/splash_screen.dart';
import 'package:pickup_driver/screens/verify_email.dart';
import 'package:pickup_driver/screens/verify_otp.dart';
import 'package:pickup_driver/services/firebase_services.dart';
import 'package:pickup_driver/services/providers.dart';
import 'package:pickup_driver/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'map/infoHandler/app_info.dart';

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
        ChangeNotifierProvider(create: (context) => Providers()),
        ChangeNotifierProvider(create: (context) => UserInfoProvider()),
        ChangeNotifierProvider(create: (context) => AppInfo()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          // '/' : (context) => const ProfileScreen(),
          // '/' : (context) => const HomeIndex(),
          '/' : (context) => const SplashScreen(),
          '/home' : (context) => const HomeIndex(),
          '/signup' : (context) => const SignupScreen(),
          '/login' : (context) => const LoginScreen(),
          '/otpverification' : (context) => const VerifyOTP(),
          '/otpverificationResetNumber' : (context) => const VerifyOTPResetNumber(),
          '/addProfilePicture' : (context) => const AddProfilePictureScreen(),
          '/editProfilePicture' : (context) => const EditProfilePicturePage(),
          '/settings' : (context) => SettingsScreen(),
          '/addPaymentCard' : (context) => const AddPaymentCardScreen(),
          '/changeNumber' : (context) => const ChangeNumberScreen(),
          '/changeEmail' : (context) => const ChangeEmailScreen(),
          '/verifyEmail' : (context) => const VerifyEmailScreen(),
          '/resetPassword' : (context) => const ResetPasswordScreen(),
        },
      ),
    );
  }
}
