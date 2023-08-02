import 'package:flutter/material.dart';
import 'package:totr/core/theme/colors.dart';
import 'package:totr/core/theme/sizes.dart';
import 'package:totr/login/presentation/component/custom_button.dart';
import 'package:totr/login/presentation/screens/company_id_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNeutralColor100,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Sizes.x15,vertical: Sizes.x20),
        child: Column(
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
            Flexible(
              child: CustomButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> CompanyIDScreen())
                    );
                  },
                  text: 'Get started',
                  enabled:true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
