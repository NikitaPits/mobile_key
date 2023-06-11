import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_key/bloc/nfc/nfc_bloc.dart';
import 'package:mobile_key/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NfcBloc(),
        ),
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}
