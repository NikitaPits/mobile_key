import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_key/bloc/nfc/nfc_bloc.dart';

class BottomModalService {
  void showConfirmOpeningLock(BuildContext context, String bandId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Material(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            context
                                .read<NfcBloc>()
                                .add(ContinueWatchingInAppEvent());
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Confirm opening this door',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
