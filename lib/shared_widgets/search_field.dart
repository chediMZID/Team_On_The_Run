import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../core/theme/colors.dart';
import '../features/contacts/presentation/view_model/home_view_model.dart';

class Search extends ConsumerWidget {
  const Search({Key? key}) : super(key: key);

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
          onChanged: (query) => ref.read(homeNotifier.searchQueryProvider.notifier).state=query,
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
              prefixIcon: Icon(Icons.search_outlined),
              hintText: 'Search',
              suffixIcon: Container(
                width: 50.0,
                height: 50.0,
                child: SvgPicture.asset(
                  'assets/icons/setting-4.svg', // Replace with the path to your SVG file
                  color: Theme.of(context).primaryColorDark,   // Set the color of the SVG
                  //width: 1,            // Set the desired width
                  //height: 1,           // Set the desired height
                ),
              ),
          ),
        ),
      ),
    );
  }
}
