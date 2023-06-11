// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'nfc_bloc.dart';

abstract class NfcState {
  const NfcState();

  List<Object> get props => [];
}

class NfcInitialState extends NfcState {}

class NfcWatchingInAppState extends NfcState {}

class NfcFoundInAppState extends NfcState {
  final String keyId;
  const NfcFoundInAppState({
    required this.keyId,
  });
}
