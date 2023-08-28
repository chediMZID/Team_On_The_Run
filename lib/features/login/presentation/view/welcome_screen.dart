import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:totr/shared_widgets/custom_buttons.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/sizes.dart';
import '../../../contacts/presentation/view/contact_screen.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
              padding: const EdgeInsets.only(top: 20.0,),
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
                      SizedBox(width: Sizes.x15,),
                     /* IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: ()=>Navigator.pop(context),
                      ),*/
                      Text(
                        'Welcome',
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
                        Text(
                          'Congratulations user X you are now connected to the Zetalink private messaging service.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 20.0,),
                        CustomButton(
                          text: 'Next',
                          enabled: true,
                          onPressed: (){
                            GoRouter.of(context).go('/home');
                           /* Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context)=>HomeScreen()),
                                (route) => false,
                            );*/
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),

            ),
          )
        ],
      ),
    );
  }
}
