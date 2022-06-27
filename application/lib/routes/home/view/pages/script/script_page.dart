import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class ScriptPage extends StatefulWidget {
  ScriptPage({Key? key}) : super(key: key);

  @override
  State<ScriptPage> createState() => _ScriptPageState();
}

class _ScriptPageState extends State<ScriptPage> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        "ROTEIROS PAGE",
        style: GoogleFonts.raleway(fontSize: 36, fontWeight: FontWeight.bold),
      ),
      Text(
        "sit amet lorem ipsum dolor sit amet",
        style: GoogleFonts.raleway(
            fontSize: 16, fontWeight: FontWeight.normal, height: 2),
      ),
    ]);
  }
}
