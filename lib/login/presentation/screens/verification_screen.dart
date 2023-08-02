import 'package:flutter/material.dart';
import 'package:totr/login/presentation/screens/welcome_screen.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/sizes.dart';
import '../../../shared_widgets/custom_button.dart';
//import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

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
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: ()=>Navigator.pop(context),
                      ),
                      Text(
                        'Activation',
                        style:Theme.of(context).textTheme.headlineLarge,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.x15,vertical: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                       /* OtpTextField(
                          numberOfFields: 6,
                          fieldWidth: 40.0,
                          fillColor: kPrimarColor0,
                          decoration: InputDecoration(
                            hintText: 'Phone number',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: kPrimarColor0,width: 1.0,),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: kPrimarColor0,width: 2.0,),
                            ),
                          ),
                        ),*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              6, (index) => SizedBox(
                            height: 66.0,
                            width: 49.0,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                              ),
                              textAlign: TextAlign.center,
                              onChanged: (value){
                                if (value.length==1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.bodyLarge,
                              keyboardType: TextInputType.number,
                            ),
                          ),),
                        ),
                        const SizedBox(height: 20.0,),
                        CustomButton(
                          text: 'Continue',
                          enabled: true,
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));

                          },
                        ),
                        const SizedBox(height: 20.0,),
                        Text(
                          'We will verify your phone number by sending you a singleSMS message. Message and data rates may apply.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Terms of Use & Privacy Policy',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );  }
}
