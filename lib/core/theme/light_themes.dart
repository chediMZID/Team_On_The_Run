import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:totr/core/theme/colors.dart';
import 'package:totr/core/theme/sizes.dart';

// import '../strings/string.dart';

ThemeData lightThemes() {
  OutlineInputBorder enabledInputborder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(color: kPrimarColor0,width: 1.0,),
  );
  OutlineInputBorder focusedInputborder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(color: kPrimarColor0,width: 2.0,),
  );
  OutlineInputBorder errorInputborder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(color: kPrimaryColor,width: 1.0,),
  );




  return ThemeData.light().copyWith(
      scaffoldBackgroundColor:kNeutralColor100,

      //backgroundColor: const Color(0xffF3F9FE),
      scrollbarTheme: const ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(Colors.grey[500]),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      dataTableTheme: const DataTableThemeData(
        dataTextStyle: TextStyle(color: Colors.black),
      ),
      dialogTheme: const DialogTheme(
        contentTextStyle: TextStyle(color: Colors.yellowAccent),
        titleTextStyle: TextStyle(color: Colors.blueAccent),
      ),
      listTileTheme:  ListTileThemeData(
        /*leadingAndTrailingTextStyle: TextStyle(
            color: kPrimarColor0,
            fontWeight: FontWeight.w700,
            fontSize: Sizes.x12,
            fontFamily: 'Poppins'
        ),*/
        titleTextStyle: TextStyle(
            color: kPrimarColor0,
            fontWeight: FontWeight.w400,
            fontSize: Sizes.x12,
            fontFamily: 'Poppins'
        ),
      ),
      popupMenuTheme: const PopupMenuThemeData(
        textStyle: TextStyle(color: Colors.blueAccent),
      ),

      inputDecorationTheme: InputDecorationTheme(

        contentPadding: EdgeInsets.symmetric(vertical: Sizes.x10,horizontal: Sizes.x24),
        /*suffixStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: Sizes.x12,
            fontFamily: 'Poppins'
        ),*/
          fillColor: Colors.blueAccent,
          hintStyle:  TextStyle(
              color: kPrimarColor0.withOpacity(0.5),
              fontWeight: FontWeight.w400,
              fontSize: Sizes.x12,
              fontFamily: 'Poppins'),
          border: enabledInputborder,
          enabledBorder: enabledInputborder,
          focusedBorder: focusedInputborder,
          errorBorder: errorInputborder,
          //focusColor: const Color(0xFF5AC8FA)
          ),
      primaryColor: kPrimarColor0,
      /*buttonTheme: ButtonThemeData(
        buttonColor: kPrimaryColor,
        disabledColor: kPrimaryColorDisabled,
        highlightColor: kPrimaryColor,
        colorScheme: ColorScheme.light(
          primary: kPrimaryColor,
          secondary: kNeutralColor100,
        ),
        textTheme: ButtonTextTheme.primary,

      ),*/

      textTheme: TextTheme(
        titleLarge:  TextStyle(
          fontFamily: 'RedHatMono',
            color: kPrimarColor0,
            fontWeight: FontWeight.w700,
            fontSize: Sizes.x30
        ),
        titleMedium: TextStyle(
          fontFamily: 'RedHatMono',
          color: kPrimarColor0,
          fontWeight: FontWeight.w400,
          fontSize: Sizes.x30
      ),
        headlineLarge: TextStyle(
            fontSize: Sizes.x24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: kPrimarColor0
        ),
        bodySmall: TextStyle(
          fontSize: Sizes.x12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: kPrimarColor0,
        ),
        bodyMedium: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: Sizes.x14,
            color: kPrimarColor0
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: Sizes.x30,
          color: kPrimarColor0,
        ),
      )
  );
}
