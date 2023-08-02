import 'package:flutter/material.dart';
import 'package:totr/login/presentation/screens/welcome_screen.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/sizes.dart';
import '../component/custom_button.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNeutralColor100,
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
                      style: TextStyle(
                          color: kPrimarColor0,
                          fontFamily: 'RedHatMono',
                          fontSize: Sizes.x30
                      ),
                      children: [
                        TextSpan(
                          text: 'ZETA',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                            text: 'link',
                            style: TextStyle(fontWeight:FontWeight.w400)
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
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
                boxShadow: [
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
                        icon: Icon(Icons.arrow_back_ios_new),
                        onPressed: ()=>Navigator.pop(context),
                      ),
                      Text(
                        'Activation',
                        style:TextStyle(
                            fontSize: Sizes.x24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: kPrimarColor0
                        ) ,
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
                          children: [
                            SizedBox(
                              height: 66.0,
                              width: 49.0,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(color: kPrimarColor0,width: 1.0,),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(color: kPrimarColor0,width: 2.0,),
                                  ),
                                ),
                                onChanged: (value){
                                  if (value.length==1)
                                    FocusScope.of(context).nextFocus();
                                },
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: Sizes.x30,
                                    fontWeight: FontWeight.w500,
                                    color: kPrimarColor0
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              height: 66.0,
                              width: 49.0,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(color: kPrimarColor0,width: 1.0,),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(color: kPrimarColor0,width: 2.0,),
                                  ),
                                ),
                                onChanged: (value){
                                  if (value.length==1)
                                    FocusScope.of(context).nextFocus();
                                },
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: Sizes.x30,
                                    fontWeight: FontWeight.w500,
                                    color: kPrimarColor0
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),SizedBox(
                              height: 66.0,
                              width: 49.0,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(color: kPrimarColor0,width: 1.0,),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(color: kPrimarColor0,width: 2.0,),
                                  ),
                                ),
                                onChanged: (value){
                                  if (value.length==1)
                                    FocusScope.of(context).nextFocus();
                                },
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: Sizes.x30,
                                    fontWeight: FontWeight.w500,
                                    color: kPrimarColor0
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),SizedBox(
                              height: 66.0,
                              width: 49.0,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(color: kPrimarColor0,width: 1.0,),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(color: kPrimarColor0,width: 2.0,),
                                  ),
                                ),
                                onChanged: (value){
                                  if (value.length==1)
                                    FocusScope.of(context).nextFocus();
                                },
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: Sizes.x30,
                                    fontWeight: FontWeight.w500,
                                    color: kPrimarColor0
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),SizedBox(
                              height: 66.0,
                              width: 49.0,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(color: kPrimarColor0,width: 1.0,),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(color: kPrimarColor0,width: 2.0,),
                                  ),
                                ),
                                onChanged: (value){
                                  if (value.length==1)
                                    FocusScope.of(context).nextFocus();
                                },
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: Sizes.x30,
                                    fontWeight: FontWeight.w500,
                                    color: kPrimarColor0
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              height: 66.0,
                              width: 49.0,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(color: kPrimarColor0,width: 1.0,),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(color: kPrimarColor0,width: 2.0,),
                                  ),
                                ),
                                onChanged: (value){
                                  if (value.length==1)
                                    FocusScope.of(context).nextFocus();
                                },
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: Sizes.x30,
                                    fontWeight: FontWeight.w500,
                                    color: kPrimarColor0
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        CustomButton(
                          text: 'Continue',
                          enabled: true,
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));

                          },
                        ),
                        SizedBox(height: 20.0,),
                        Text(
                          'We will verify your phone number by sending you a singleSMS message. Message and data rates may apply.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: Sizes.x12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: kPrimarColor0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Terms of Use & Privacy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: Sizes.x14,
                        color: kPrimarColor0
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );  }
}
