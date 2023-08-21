import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:totr/shared_widgets/filter.dart';

import '../core/theme/colors.dart';
import '../features/contacts/presentation/view_model/home_view_model.dart';

class Search extends ConsumerWidget {


  final bool filter;
  final ValueChanged<String>? onChanged;
  const Search({required this.onChanged,required this.filter, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final HomeNotifier homeNotifier = ref.watch(homeProvider);

    return Focus(
      onFocusChange: (hasFocus) {
        ref.read(homeNotifier.searchFocusProvider.notifier).state = hasFocus;
      },
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: ref.watch(homeNotifier.searchFocusProvider)
              ? Theme.of(context).scaffoldBackgroundColor
              : Colors.transparent,
          border: Border.all(
            color: Colors.transparent,
            width: 0.0,
          ),
          borderRadius: BorderRadius.circular(55.0),
        ),
        child: TextField(
          cursorColor: Theme.of(context).primaryColor,
          autocorrect: false,
          enableSuggestions: false,
          onChanged:onChanged,
          textAlignVertical: TextAlignVertical.center,
          style: Theme.of(context).textTheme.labelMedium,
          decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(55.0),
                borderSide: BorderSide(color: Theme.of(context).focusColor,width:1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(55.0),
                borderSide:  BorderSide(color: Theme.of(context).focusColor,width:1.0),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/search.svg'),
              ),
              hintText: 'Search',

              suffixIcon: filter ? IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                padding: EdgeInsets.all(5.0),
                onPressed: (){
                  showFilter(context);
                },
                icon: SvgPicture.asset(
                  'assets/icons/setting-4.svg',
                  color: Theme.of(context).primaryColorDark,
                  //width: 1,
                  //height: 1,
                ),

              ):const SizedBox(),
          ),
        ),
      ),
    );
  }
}
