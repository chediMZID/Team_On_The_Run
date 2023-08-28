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
      disabledColor: kPrimaryColorDisabled,
      primaryColorDark: kPrimaryColor,
      canvasColor: kNeutralColor50,
      shadowColor: shadowColorlight,
      focusColor: kNeutralColor0,
      primaryColor: kPrimarColor0,



      //backgroundColor: const Color(0xffF3F9FE),
      scrollbarTheme: const ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(Colors.grey[500]),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: kNeutralColor50,
        //color: Colors.white,
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
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
       // contentTextStyle:
        titleTextStyle: TextStyle(
          color: kPrimarColor0,
          fontWeight: FontWeight.w700,
          fontSize: Sizes.x16,
          letterSpacing: 0.07,
          fontFamily: 'Poppins'
      ),
      ),
      dividerColor: kNeutralColor0,
      listTileTheme:  ListTileThemeData(
        /*leadingAndTrailingTextStyle: TextStyle(
            color: kPrimarColor0,
            fontWeight: FontWeight.w700,
            fontSize: Sizes.x12,
            fontFamily: 'Poppins'
        ),*/
        titleTextStyle: TextStyle(
            color: kPrimarColor0,
            fontWeight: FontWeight.w500,
            fontSize: Sizes.x14,
            fontFamily: 'Poppins'
        ),
      ),

      popupMenuTheme: PopupMenuThemeData(
        color: kNeutralColor100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)
        ),
        textStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: Sizes.x14,
            color: Colors.white
        ),
      ),
      iconTheme: IconThemeData(
        color: kPrimaryColor,
        size: Sizes.x24,
      ),



      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
          fontSize: Sizes.x12,
        ),

        contentPadding: EdgeInsets.symmetric(vertical: Sizes.x10,horizontal: Sizes.x24),
        /*suffixStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: Sizes.x12,
            fontFamily: 'Poppins'
        ),*/
        focusColor: Colors.white,
          fillColor: Colors.white,
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
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            fontSize: Sizes.x16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(55.0),
            //side: BorderSide(width: 1.0,color: Colors.white)
          ),
        )
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          //backgroundColor: Colors.greenAccent,
          padding: EdgeInsets.symmetric(horizontal: 25,),
          //backgroundColor: Colors.yellow,
          foregroundColor: kPrimarColor0,
          textStyle: TextStyle(
            fontSize: Sizes.x16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: kPrimarColor0,
          ),
        )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kNeutralColor0,
        selectedLabelStyle: TextStyle(
            fontSize: Sizes.x12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            //color: kPrimaryColor
        ),
        unselectedLabelStyle: TextStyle(
            fontSize: Sizes.x12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            //color: kPrimarColor0
        ),
        elevation:20.0,
        backgroundColor: Colors.white,
        //type: BottomNavigationBarType.shifting
      ),



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
        labelMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: Sizes.x14,
          color: kPrimarColor0,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: Sizes.x12,
          color: kPrimarColor0,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
          fontSize: Sizes.x11,
          color: kPrimarColor0,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: Sizes.x14,
          color: kPrimarColor0,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: Sizes.x18,
          color: kPrimarColor0,
        ),
      )
  );
}
