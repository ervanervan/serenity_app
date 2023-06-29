import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:serenity/pages/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
          (route) => false);
    });

    return Scaffold(
      backgroundColor:
          Colors.white, // Ganti dengan warna latar belakang yang diinginkan
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 64,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset('assets/svgs/logo.svg'),
                ),
                const SizedBox(
                  height: 16,
                ),
                // RichText(
                //     textAlign: TextAlign.center,
                //     text: TextSpan(
                //       text:
                //           "Senayan Equstrian Ragunan\nErlangga Nilam Hang\nTuah Yselatan",
                //       style: GoogleFonts.mulish(
                //         fontSize: 10,
                //         fontWeight: FontWeight.w600,
                //         color: Color(0xFF000000),
                //       ),
                //     )),
                Text(
                  'Senayan Equstrian Ragunan Erlangga Nilam Hang Tuah Yselatan',
                  style: GoogleFonts.mulish(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
