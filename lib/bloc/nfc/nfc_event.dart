// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'nfc_bloc.dart';

abstract class NfcEvent {}

class WatchInRegistration extends NfcEvent {
  BuildContext context;
  WatchInRegistration({
    required this.context,
  });
}

class WatchInApp extends NfcEvent {
  BuildContext context;
  WatchInApp({
    required this.context,
  });
}

class WatchInEvent extends NfcEvent {
  BuildContext context;
  WatchInEvent({
    required this.context,
  });
}

class KeyWasFound extends NfcEvent {
  String keyId;
  BuildContext context;
  KeyWasFound({
    required this.keyId,
    required this.context,
  });
}

class ContinueWatchingInAppEvent extends NfcEvent {}
