
import 'package:digischein_flutter/pages/account_page.dart';
import 'package:digischein_flutter/pages/add_page.dart';
import 'package:digischein_flutter/pages/home_page.dart';
import 'package:digischein_flutter/pages/login_page.dart';
import 'package:digischein_flutter/pages/manage_page.dart';
import 'package:digischein_flutter/provider/reports_provider.dart';
import 'package:digischein_flutter/provider/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  /**Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );**/
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ReportsProvider())
      ],
      child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DIGISCHEIN',
      theme: ThemeData(
        fontFamily: 'Arial',
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'DIGISCHEIN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loggedIn = true;

  final _pages = <Widget>[
    HomePage(),
    AddPage(),
    ManagePage(),
    AccountPage()
  ];

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    if (loggedIn == false) {
      return LoginPage();
    }
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('lib/assets/logo.png', fit: BoxFit.cover, height: 50, alignment: Alignment.center,),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        shadowColor: Colors.transparent,
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          gap: 8,
          backgroundColor: Colors.transparent,
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: const [
            GButton(
              icon: CupertinoIcons.home,
              text: 'Home',
            ),
            GButton(
              icon: CupertinoIcons.add_circled,
              text: 'ADD',
            ),
            GButton(
              icon: CupertinoIcons.list_bullet_below_rectangle,
              text: 'Manage',
            ),
            GButton(
              icon: CupertinoIcons.person,
              text: 'Profile',
            )
          ],
        ),
      ),
    );
  }
}
