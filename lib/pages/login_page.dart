import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenity/components/input_with_icon.dart';
import 'package:serenity/pages/bottom_bar.dart';
import 'package:serenity/utils/colors.dart';
import 'package:serenity/utils/localStorage.dart';
import 'package:serenity/utils/text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  String username = '';
  @override
  void initState() {
    super.initState();
    _fetchUsername();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _handleScreenTap() {
    // Remove focus from text field
    FocusScope.of(context).unfocus();
  }

  void _handleRegister() {
    setItem("username", _usernameController.text);
    if (_usernameController.text == '') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Warning"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("You must insert your Username!"),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomBar()));
    }
  }

  Future<void> _fetchUsername() async {
    String? username = await getItem("username");
    setState(() {
      String value = username ?? '';
      this.username = value;
    });
    checkIsLogin(); // Call the checkIsLogin function here
  }

  Future<void> checkIsLogin() async {
    if (username != '') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomBar()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleScreenTap,
      child: Scaffold(
        backgroundColor: background,
        body: SafeArea(
          child: Container(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        SvgPicture.asset(
                          "assets/svgs/logo.svg",
                          width: 64,
                          height: 64,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Senayan Equistrian Ragunan\nErlangga Nilam Hang Tuah \nYselatan',
                          textAlign: TextAlign.center,
                          style: Body1,
                        )
                      ]),
                ),
                Container(
                  child: Column(children: [
                    SizedBox(
                      height: 90,
                    ),
                    Text(
                      "Daftar",
                      style: Heading1,
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 130),
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: Column(children: [
                    InputWithIcon(
                      controller: _usernameController,
                      icon: "assets/svgs/user-icon.svg",
                      hintname: "Username",
                    ),
                    SizedBox(
                      height: 64,
                    ),
                    GestureDetector(
                      onTap: _handleRegister,
                      child: Container(
                        padding: EdgeInsets.only(top: 13, bottom: 13),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "Get Started",
                          textAlign: TextAlign.center,
                          style: BodyButtonLarge,
                        ),
                      ),
                    )
                  ]),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
