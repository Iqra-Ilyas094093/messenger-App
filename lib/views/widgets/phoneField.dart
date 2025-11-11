import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class phoneField extends StatelessWidget {

  TextEditingController controller;
  phoneField({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      initialCountryCode: "PK",
      dropdownTextStyle: GoogleFonts.splineSans(
        color: Theme.of(context).brightness == Brightness.dark?Colors.white:Colors.black, // Apply country code color based on the theme
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          hintText: 'Enter Number',
          // hintStyle: TextStyle(color: secondaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          filled: true,

          suffixIcon: Icon(Icons.phone, color: Colors.white),
          fillColor: Theme.of(context).colorScheme.surface,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFF13DAEC), width: 2),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12)
          )
      ),
    );
  }
}
