import 'package:flutter/material.dart';
import 'package:pickup_driver/services/firebase_services.dart';
import 'package:pickup_driver/widgets/custom_text_theme.dart';

import '../widgets/widgets.dart';

class AddPaymentCardScreen extends StatefulWidget {
  const AddPaymentCardScreen({Key? key}) : super(key: key);

  @override
  State<AddPaymentCardScreen> createState() => _AddPaymentCardScreenState();
}

class _AddPaymentCardScreenState extends State<AddPaymentCardScreen> {
  CustomTextTheme textTheme = CustomTextTheme();
  FirebaseRealtimeDatabase realtimeDatabase = FirebaseRealtimeDatabase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Add a payment card'),
        actions: [TextButton(onPressed: (){
          Navigator.pop(context);
          realtimeDatabase.skippedPaymentInfo(context);
          // Todo: update card configured to false in database
        }, child:  Text('skip',style: textTheme.textDark,),)],
      ),
      body: const PaymentCardForm(),
      bottomNavigationBar: const Disclaimer(text: 'By proceeding you agree to our ', actionText: 'Terms & Conditions',),
    );
  }
}
