import 'package:application/assets/constants.dart';
import 'package:application/assets/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePage extends StatefulWidget {
  final Color color;
  ExplorePage({Key? key, required this.color}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
            left: size.width < 1024 ? 20 : 200,
            right: size.width < 1024 ? 20 : 200,
            top: 30), //110
        child: Column(children: [
          Text(
            "Lorem ipsum dolor",
            style:
                GoogleFonts.raleway(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          Text(
            "sit amet lorem ipsum dolor sit amet",
            style: GoogleFonts.raleway(
                fontSize: 16, fontWeight: FontWeight.normal, height: 2),
          ),
          SizedBox(
            height: 36,
          ),
          TextField(
            textAlign: TextAlign.start,
            keyboardType: TextInputType.text,
            cursorColor: widget.color,
            decoration: InputDecoration(
                hoverColor: widget.color,
                hintText: 'Buscar cards, roteiros e pacientes...',
                hintStyle: TextStyle(fontSize: 16),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide: BorderSide(
                      width: 2, style: BorderStyle.solid, color: widget.color),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                      color: Constants.gray),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(16),
                fillColor: Constants.background,
                suffixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 0, right: 10),
                  child: SvgPicture.asset(
                    'lib/assets/image/search.svg',
                    height: 11,
                  ),
                )),
          ),
        ]));
  }
}
