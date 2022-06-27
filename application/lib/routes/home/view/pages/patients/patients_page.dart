import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientPage extends StatefulWidget {
  PatientPage({Key? key}) : super(key: key);

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        "PACIENTES PAGE",
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
