import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/login/presentation/screens/verification_screen.dart';
import 'package:totr/providers/login_provider.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/sizes.dart';
import '../../../shared_widgets/custom_button.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/zetalogo.png'),
                RichText(
                    text:TextSpan(
                      children: [
                        TextSpan(
                          text: 'ZETA',
                          style:Theme.of(context).textTheme.titleLarge,
                        ),
                        TextSpan(
                          text: 'link',
                          style:Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
                boxShadow: const [
                  BoxShadow(
                    //color: Color(0x2E14243E),
                    color: kNeutralColor700,
                    offset: Offset(0, 0),
                    blurRadius: 55,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child:Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: ()=>Navigator.pop(context),
                      ),
                      Text(
                        'Registration',
                        style:Theme.of(context).textTheme.headlineLarge,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.x15,vertical: 50.0),
                    child: Consumer(
                      builder: (context,ref,child){
                        final phoneNumberController = TextEditingController();
                        //final loginNotifier = ref.watch(loginProvider);
                        //final enabledProvider = ref.watch(loginNotifier.enabledProvider);
                        final enabled = ref.watch(enabledProvider);
                        //final loginNotifier = ref.watch(loginProvider);

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            IntlPhoneField(
                              style:Theme.of(context).textTheme.bodyMedium,
                              decoration: const InputDecoration(
                                errorText: 'Invalid phone Number',
                                hintText: 'Phone number',
                              ),
                              invalidNumberMessage: null,
                              controller: phoneNumberController,
                              onChanged: (value){
                                if(!enabled) {
                                  ref.read(enabledProvider.notifier).state=true;
                                }
                              },
                            ),

                            const SizedBox(height: 4.0,),
                            CustomButton(
                              text: 'Continue',
                              enabled: enabled,
                              onPressed: ()async{
                                print(ref.watch(loginProvider));
                                final phoneNumber =phoneNumberController.text;
                                ref.read(loginProvider.notifier).updatePhoneNumber(phoneNumber);
                                final user = ref.watch(loginProvider);
                                print(user);
                                final isVerified = await ref.watch(authRepositoryProvider)
                                    .verifyPhoneNumber(user);

                                if(isVerified){
                                  ref.watch(authRepositoryProvider)
                                      .sendVerificationCode(user);

                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>const VerificationScreen()));
                                } else {
                                  ref.read(enabledProvider.notifier).state=false;
                                }

                              },
                            ),
                            const SizedBox(height: 20.0,),
                            Text(
                                'We will verify your phone number by sending you a singleSMS message. Message and data rates may apply.',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodySmall
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Terms of Use & Privacy Policy',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium

                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
