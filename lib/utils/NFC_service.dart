import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_key/bloc/nfc/nfc_bloc.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NFCService {
  ValueNotifier<dynamic> result = ValueNotifier(null);
  NFCService();
  bool isAndroidScanWidgetOpen = false;
  void readNFC(BuildContext context) async {
    NfcManager.instance.stopSession();
    String returnedId = '';
    await NfcManager.instance.isAvailable();
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      List newRes = tag.data['nfca'] != null
          ? tag.data['nfca']['identifier'] as List
          : tag.data['mifare']['identifier'] as List;
      returnedId = newRes.join('-');
      NfcManager.instance.stopSession();
      if (context.read<NfcBloc>().state is NfcWatchingInAppState) {
        context
            .read<NfcBloc>()
            .add(KeyWasFound(keyId: returnedId, context: context));
      }

      if (!Platform.isIOS) {
        readNFC(context);
      }
    });
  }
}
