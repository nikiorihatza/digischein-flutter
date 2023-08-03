import 'package:digischein_flutter/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';

import '../model/user.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = UserProvider();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(50),
            child: Text('Welcome back, ${user.user.firstname}!')
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: const Text('Made for')
            ),
            Container(
              child: Image.asset('lib/assets/gpv-logo.png', fit: BoxFit.cover, height: 150, alignment: Alignment.center,),
            ),
          ],
        )
      ],
    );
  }
}