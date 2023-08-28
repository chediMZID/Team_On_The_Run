import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/features/login/presentation/view/verification_screen.dart';
import 'package:totr/features/login/presentation/widgets/customContainer.dart';
import 'package:totr/features/login/presentation/widgets/headline_widget.dart';
import 'package:totr/features/login/presentation/widgets/logo_widget.dart';

import '../../../../core/theme/sizes.dart';
import '../../../../shared_widgets/custom_buttons.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../view_model/login_view_model.dart';
import '../widgets/privacy_text.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 2,
            child: LogoWidget()
          ),
          Expanded(
            flex: 5,
            child: CustomContainer(
                child: Column(
                  children: [
                    const HeadLine(text: 'Registration'),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:Paddings.medium ,vertical: Paddings.superLarge),
                      child: Consumer(
                        builder: (context,ref,child){
                          final LoginNotifier loginNotifier = ref.watch(loginProvider);
                          final bool enabled = ref.watch(loginNotifier.enabledProvider);
                          //print('Id :${ref.watch(loginNotifier.userProvider.notifier).state.companyId}');
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              IntlPhoneField(
                                style:Theme.of(context).textTheme.bodyMedium,
                                decoration:  InputDecoration(
                                  errorText: enabled ? null : 'Invalid phone Number',
                                  hintText: 'Phone number',
                                ),
                                invalidNumberMessage: null,
                                controller: loginNotifier.phoneNumberController,
                                onChanged: (value){
                                  if(!enabled) {
                                    ref.read(loginNotifier.enabledProvider.notifier).state=true;
                                  }
                                },
                              ),

                              const SizedBox(height: 4.0,),
                              CustomButton(
                                text: 'Continue',
                                enabled: enabled,
                                onPressed: ()async{
                                  final phoneNumber = loginNotifier.phoneNumberController.text;
                                  final authRepo = loginNotifier.authRepositoryProvider;
                                  ref.read(loginNotifier.userProvider.notifier).state=
                                      ref.read(loginNotifier.userProvider.notifier).state.copyWith(phoneNumber: phoneNumber);

                                  final isVerified = await ref.watch(authRepo).verifyPhoneNumber(ref.watch(loginNotifier.userProvider.notifier).state);
                                  if(isVerified){
                                    ref.read(authRepo).sendVerificationCode(ref.watch(loginNotifier.userProvider.notifier).state);
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const VerificationScreen()));
                                  } else {
                                    ref.read(loginNotifier.enabledProvider.notifier).state=false;
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
                    const Expanded(
                      child: PrivacyText(),
                    )
                  ],
                )
            )
          )
        ],
      ),
    );
  }
}
