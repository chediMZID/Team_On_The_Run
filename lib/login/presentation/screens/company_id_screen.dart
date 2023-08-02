import 'package:flutter/material.dart';
import 'package:totr/login/presentation/component/custom_button.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/sizes.dart';
import 'phone_number_screen.dart';


class CompanyIDScreen extends StatelessWidget {
  const CompanyIDScreen({Key? key}) : super(key: key);

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
                        'Registration',
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
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Company ID',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: kPrimarColor0,width: 1.0,),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: kPrimarColor0,width: 2.0,),
                            ),
                          ),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: Sizes.x14,
                            fontWeight: FontWeight.w500,
                            color: kPrimarColor0
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        CustomButton(
                            text: 'Continue',
                            enabled: true,
                            onPressed: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=> PhoneNumberScreen()));

                            },
                        )

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
    );
  }
}
