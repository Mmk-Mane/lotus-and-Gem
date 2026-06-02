import 'package:flutter/material.dart';
import 'package:lotusandgems/airtable/airtable_provider.dart';
import 'package:lotusandgems/data/user_info_provider.dart';
import 'package:lotusandgems/firebase/auth_provider.dart';

import 'package:provider/provider.dart';
import 'package:lotusandgems/screens/login_page.dart';
import 'package:lotusandgems/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserInfoProvider()),
        ChangeNotifierProvider(create: (_) => AirtableProvider()),
      ],
      child: MaterialApp(
        title: 'Lotus & Gems',
        theme: MKAppTheme.lightTheme,
        darkTheme: MKAppTheme.darkTheme,
        themeMode: ThemeMode.light,
        home: const LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
