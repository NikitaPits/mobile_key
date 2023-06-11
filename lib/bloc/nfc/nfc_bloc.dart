import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_key/utils/NFC_service.dart';
import 'package:mobile_key/utils/bottom_modal_service.dart';

part 'nfc_event.dart';
part 'nfc_state.dart';

class NfcBloc extends Bloc<NfcEvent, NfcState> {
  NfcBloc() : super(NfcInitialState()) {
    //Bloc when looking for lock
    on<WatchInApp>(((event, emit) async => {
          NFCService().readNFC(event.context),
          emit(NfcWatchingInAppState()),
        }));
    on<KeyWasFound>((event, emit) => {
          emit(NfcFoundInAppState(keyId: event.keyId)),
          BottomModalService()
              .showConfirmOpeningLock(event.context, event.keyId),
        });
    on<ContinueWatchingInAppEvent>(
      (event, emit) => emit(NfcWatchingInAppState()),
    );
  }
}
