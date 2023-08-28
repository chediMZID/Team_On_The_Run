import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:totr/features/login/presentation/widgets/customContainer.dart';
import 'package:totr/features/login/presentation/widgets/headline_widget.dart';
import 'package:totr/features/login/presentation/widgets/logo_widget.dart';
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
          const Expanded(
            flex: 2,
            child:LogoWidget(),
          ),
          Expanded(
            flex: 5,
            child:CustomContainer(
              child: Column(
                children: [
                  const HeadLine(text: 'Welcome',backArrow: false,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Paddings.medium,vertical: Paddings.superLarge),
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
            )
          )
        ],
      ),
    );
  }
}
