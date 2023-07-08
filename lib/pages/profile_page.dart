import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:serenity/components/input_with_icon.dart';
import 'package:serenity/pages/bottom_bar.dart';
import 'package:serenity/pages/login_page.dart';
import 'package:serenity/utils/colors.dart';
import 'package:serenity/utils/text_style.dart';
import 'package:serenity/utils/localStorage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _usernameController = TextEditingController();
  String value = "";

  @override
  void initState() {
    super.initState();
    _fetchUsername();
    // _usernameController = TextEditingController(text: value);
  }

  Future<void> _fetchUsername() async {
    String? username = await getItem("username");
    print("username >> $username");
    setState(() {
      String? value = username ?? '';
      this._usernameController = TextEditingController(text: value);
    });
  }

  void _handleLogout() {
    removeItem("username");
    removeItem("favorite");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

/*

void _handleLogout() {
print("dsini ntr pakai localStorage aja");
Pada fungsi `removeItem("username"); ini akan menghapus item dengan kunci "username" 
dari penyimpanan lokal aplikasi. Sedangkan fungsi `removeItem("favorite");` akan 
menghapus item dengan kunci "favorite" dari penyimpanan lokal aplikasi. Setelah itu
maka pengguna akan diarahkan ke halaman baru yaitu halaman `LoginPage`.
}

*/

  void _handleUpdateUsername() {
    print("dsini ntr pakai localStorage aja");
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
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Username updated successfully!"),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BottomBar()));
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _appBar(context),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 24, right: 24, top: 100, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Edit Your Username",
                    style: SubHeading2,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InputWithIcon(
                    controller: _usernameController,
                    hintname: "Username",
                    icon: "assets/svgs/user-icon.svg",
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: _handleUpdateUsername,
                    child: Container(
                      padding: EdgeInsets.only(top: 13, bottom: 13),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        "Update Username",
                        textAlign: TextAlign.center,
                        style: BodyButtonLarge,
                      ),
                    ),
                  ),
                ],
              ),

              GestureDetector(
                onTap: _handleLogout,
                child: Container(
                  padding: EdgeInsets.only(top: 13, bottom: 13),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: danger, borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    "Sign Out",
                    textAlign: TextAlign.center,
                    style: BodyButtonLarge,
                  ),
                ),
              ),
              // SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: background,
      title: Padding(
        padding: const EdgeInsets.only(top: 10, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const BottomBar()));
              },
              icon: SvgPicture.asset("assets/svgs/chevron-left.svg"),
            ),
            Text(
              "Profile",
              style: Heading2,
            ),
          ],
        ),
      ),
    );
  }
}
