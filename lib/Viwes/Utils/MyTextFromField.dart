import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shootbee/Viwes/Utils/AppColors.dart';

class MyTextField extends StatefulWidget {
  String hintText;
  double fontsize;
  FontWeight fontWeight;
  Widget? child;
  Color iconcolor;
  TextEditingController controller;
  IconData? pIcon;
  bool isFocase;

  MyTextField({
    Key? key,
    required this.hintText,
    this.pIcon,
    this.isFocase = false,
    this.fontsize = 12,
    this.fontWeight = FontWeight.w500,
    this.child,
    this.iconcolor = const Color(0xff4A89F5),
    required this.controller,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final FocusNode _focusNode = FocusNode();

  bool _isFocused = false;
  @override
  void initState() {
    // _focusNode.addListener(() {
    //   setState(() {
    //     _isFocused = _focusNode.hasFocus;
    //   });
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        maxLines: 1,
        controller: widget.controller,
        cursorColor: Colors.white,
        cursorHeight: 20,
        style: GoogleFonts.montserrat(
          //backgroundColor: Color(0xff22BB9C),

          color: const Color(0xff212121),
          height: 1.5,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        focusNode: _focusNode,
        decoration: InputDecoration(
            //focusColor: Color(0xff22BB9C),
            suffixIconConstraints:
                const BoxConstraints(maxHeight: double.infinity),
            suffixIcon: widget.child,
            prefixIcon: Icon(widget.pIcon),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 18.0, 18.0, 15.0),
            hintText: widget.hintText,
            hintStyle: GoogleFonts.montserrat(
              fontSize: widget.fontsize,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.50),
            ),
            fillColor: _isFocused
                ? Color.fromARGB(255, 148, 231, 214).withOpacity(.2)
                : const Color(0xffFAFAFA),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColor.darkPink, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            )),
      ),
    );
  }
}
