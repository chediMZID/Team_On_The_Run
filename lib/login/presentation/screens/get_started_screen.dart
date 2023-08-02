import 'package:flutter/material.dart';
//import 'package:totr/core/theme/colors.dart';
import 'package:totr/core/theme/sizes.dart';
import 'package:totr/shared_widgets/custom_button.dart';
import 'package:totr/login/presentation/screens/company_id_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kNeutralColor100,
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
                      children: [
                        TextSpan(
                          text: 'ZETA',
                          style: Theme.of(context).textTheme.titleLarge,
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
            Flexible(
              child: CustomButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> const CompanyIDScreen())
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
