import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/features/login/presentation/widgets/customContainer.dart';
import 'package:totr/features/login/presentation/widgets/headline_widget.dart';
import 'package:totr/features/login/presentation/widgets/logo_widget.dart';
import 'package:totr/features/login/presentation/widgets/privacy_text.dart';
import 'package:totr/shared_widgets/custom_buttons.dart';
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
          const Expanded(
            flex: 2,
            child: LogoWidget(),
          ),
          Expanded(
            flex: 5,
            child:CustomContainer(
                child: Column(
                  children: [
                    const HeadLine(text: 'Registration'),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Paddings.medium,vertical:Paddings.superLarge),
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
                    const PrivacyText(),
                  ],
                )
            )
          )
        ],
      ),
    );
  }
}
