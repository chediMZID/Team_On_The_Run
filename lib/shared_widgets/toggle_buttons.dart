import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/features/contacts/presentation/view_model/contact_view_model.dart';


class Toggle extends ConsumerWidget {
  const Toggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeNotifier homeNotifier = ref.watch(homeProvider);
    return ButtonBar(
      buttonPadding: EdgeInsets.zero,
      alignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          //statesController: ,
          onPressed: () {
            if (!ref.watch(homeNotifier.buttonProvider)) {
              ref.read(homeNotifier.buttonProvider.notifier).state =
              !ref.read(homeNotifier.buttonProvider.notifier).state;
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: ref.watch(homeNotifier.buttonProvider) ?Theme.of(context).primaryColorDark:Theme.of(context).scaffoldBackgroundColor,

          ),
          child: Text(
              'Organization',
              style: TextStyle(
                color:ref.watch(homeNotifier.buttonProvider) ?Colors.white:Theme.of(context).focusColor ,
              )

          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (ref.watch(homeNotifier.buttonProvider)) {
              ref.read(homeNotifier.buttonProvider.notifier).state =
              !ref.read(homeNotifier.buttonProvider.notifier).state;
            }
          },
          style: ElevatedButton.styleFrom(

            elevation: 0.0,
            backgroundColor: !ref.watch(homeNotifier.buttonProvider) ? Theme.of(context).primaryColorDark : Theme.of(context).scaffoldBackgroundColor,

          ),
          child: Text(
              'Contacts',
              style: TextStyle(
                color:!ref.watch(homeNotifier.buttonProvider) ?Colors.white:Theme.of(context).focusColor ,
              )

          ),
        ),
      ],
    );
  }
}
/*return ToggleButtons(
        children: [
          Text('Organization'),
          Text('Contacts'),
        ],
        onPressed: (int index){
          ref.read(homeNotifier.toggleListProvider.notifier).state[index]=
          !ref.read(homeNotifier.toggleListProvider.notifier).state[index];
        },
        isSelected: ref.watch(homeNotifier.toggleListProvider)
    );*//*

  }
}
*//*
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/contacts/presentation/view_model/contact_view_model.dart';

class Buttons extends ConsumerWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final HomeNotifier homeNotifier = ref.watch(homeProvider);

    return Container(
      width: 200,
      child: Stack(
        children: [

          Positioned(
            left: 0,

            child: ref.watch(homeNotifier.ButtonProvider)?
            ElevatedButton(
              onPressed: () {
                if(!ref.watch(homeNotifier.ButtonProvider)) {
                  ref.read(homeNotifier.ButtonProvider.notifier).state=!ref.read(homeNotifier.ButtonProvider.notifier).state;
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: ref.watch(homeNotifier.ButtonProvider)? 8 : 2, // Adjust elevation levels
              ),
              child: Text('Button 1'),
            ):ElevatedButton(
              onPressed: () {
                if(ref.watch(homeNotifier.ButtonProvider)) {
                  ref.read(homeNotifier.ButtonProvider.notifier).state=!ref.read(homeNotifier.ButtonProvider.notifier).state;
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: !ref.watch(homeNotifier.ButtonProvider) ? 8 : 2, // Adjust elevation levels
              ),
              child: Text('Button 2'),
            ),
          ),
          Positioned(
            left: 40.0,
            child: ElevatedButton(
              onPressed: () {
                if(ref.watch(homeNotifier.ButtonProvider)) {
                  ref.read(homeNotifier.ButtonProvider.notifier).state=!ref.read(homeNotifier.ButtonProvider.notifier).state;
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: !ref.watch(homeNotifier.ButtonProvider) ? 8 : 2, // Adjust elevation levels
              ),
              child: Text('Button 2'),
            ),
          ),

        ],
      ),
    );
  }
}
*/
/*

class StackedButtons extends StatefulWidget {
  @override
  _StackedButtonsState createState() => _StackedButtonsState();
}

class _StackedButtonsState extends State<StackedButtons> {
  int selectedButtonIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0,

          child: ElevatedButton(
            onPressed: () {
              setState(() {
                selectedButtonIndex = 0;
              });
            },
            style: ElevatedButton.styleFrom(
              elevation: selectedButtonIndex == 0 ? 8 : 2,
            ),
            child: Text('Button 1'),
          ),
        ),
        Positioned(
          left: 20.0,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                selectedButtonIndex = 1;
              });
            },
            style: ElevatedButton.styleFrom(
              elevation: selectedButtonIndex == 1 ? 8 : 2,
            ),
            child: Text('Button 2'),
          ),
        ),
      ],
    );
  }
}

*/
/*


class ToggleSwitch extends ConsumerWidget {
  const ToggleSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeNotifier homeNotifier = ref.watch(homeProvider);
    //final List<bool> toggleList = ref.watch(homeNotifier.toggleListProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: ref.watch(homeNotifier.ButtonProvider) ? 0 : null,
          right: !ref.watch(homeNotifier.ButtonProvider)? 0 : null,
          child: ElevatedButton(
            onPressed: () {
              if(ref.watch(homeNotifier.ButtonProvider)) {
                ref.read(homeNotifier.ButtonProvider.notifier).state=!ref.read(homeNotifier.ButtonProvider.notifier).state;
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text('Organization'),
          ),
        ),
        Positioned(
          left: !ref.watch(homeNotifier.ButtonProvider) ? 0 : null,
          right: ref.watch(homeNotifier.ButtonProvider) ? 0 : null,
          child: ElevatedButton(
            onPressed: () {
              if(!ref.watch(homeNotifier.ButtonProvider)) {
                ref.read(homeNotifier.ButtonProvider.notifier).state=!ref.read(homeNotifier.ButtonProvider.notifier).state;
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text('Contacts'),
          ),
        ),
      ],
    );
  }
}
*/
