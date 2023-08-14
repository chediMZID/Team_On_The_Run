import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/shared_widgets/custom_toggle_buttons.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/sizes.dart';
import '../view_model/login_view_model.dart';
import 'phone_number_screen.dart';

class CompanyIDScreen extends StatelessWidget {
  const CompanyIDScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextSpan(
                          text: 'link',
                          style: Theme.of(context).textTheme.titleMedium,
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
                        icon: Icon(Icons.arrow_back_ios_new,color: Theme.of(context).primaryColor,),
                        onPressed: ()=>Navigator.pop(context),
                      ),
                      Text(
                          'Registration',
                          style:Theme.of(context).textTheme.headlineLarge
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.x15,vertical: 50.0),
                    child: Consumer(
                      builder: (context,ref,child){
                        final LoginNotifier loginNotifier = ref.watch(loginProvider);
                        final bool enabled = ref.watch(loginNotifier.enabledProvider);
                        print('enabledProvider : $enabled');
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 80.0,
                              child: TextFormField(
                                //onTap:() => ref.read(loginNotifier.enabledProvider.notifier).state=true ,
                                onChanged:(value) {
                                  if(!enabled) {
                                    ref.read(loginNotifier.enabledProvider.notifier).state=true;
                                  }
                                } ,
                                controller: loginNotifier.companyIdController,
                                style: Theme.of(context).textTheme.bodyMedium,
                                decoration:  InputDecoration(
                                  errorText: enabled ? null:"Invalid ID number",
                                  hintText: 'Company ID',
                                ),
                              ),
                            ),

                            //const SizedBox(height: 20.0,),
                            CustomButton(
                              text: 'Continue',
                              enabled: enabled,
                              onPressed: ()async{
                                final companyId = loginNotifier.companyIdController.text;
                                final authRepository = loginNotifier.authRepositoryProvider;
                                final isVerified = await ref.watch(authRepository).verifyCompanyId(companyId) ;
                                if(isVerified){

                                  ref.read(loginNotifier.userProvider.notifier).state=
                                      ref.read(loginNotifier.userProvider.notifier).state.copyWith(companyId: companyId);
                                  loginNotifier.companyIdController.text ="";

                                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const PhoneNumberScreen()));
                                }else{
                                  ref.read(loginNotifier.enabledProvider.notifier).state=false;
                                }

                                /*final int companyId = int.parse(companyIdController.text);
                                final authService = await context.read(authService.future);
                                final isVerified = await authService.verifyCompanyId(companyId);

                                if (isVerified) {
                                // Company ID is verified, proceed to the next screen.
                                // Navigator.push(...);
                                } else {
                                // Show error message or handle invalid company ID.
                                }*/

                              },
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  Text(
                    'Terms of Use & Privacy Policy',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
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
