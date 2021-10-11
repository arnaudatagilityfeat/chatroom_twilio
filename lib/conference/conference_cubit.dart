import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:chatroom_twilio/conference/participant_widget.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:twilio_programmable_video/twilio_programmable_video.dart';
import 'package:uuid/uuid.dart';
import 'package:equatable/equatable.dart';

abstract class ConferenceState extends Equatable {
  const ConferenceState();

  @override
  List<Object> get props => [];
}

class ConferenceInitial extends ConferenceState {}

class ConferenceLoaded extends ConferenceState {}

class ConferenceCubit extends Cubit<ConferenceState> {
  final String name;
  final String token;
  final String identity;
  final List<ParticipantWidget> _participants = [];
  var trackId;

  ConferenceCubit({
    required this.name,
    required this.token,
    required this.identity,
  }) : super(ConferenceInitial());

  List<ParticipantWidget> get participants {
    return [..._participants];
  }

  ParticipantWidget _buildParticipant({
    required Widget child,
    required String? id,
  }) {
    return ParticipantWidget(
      id: id,
      child: child,
    );
  }
  
  /// TODO: Implement a connect, listeners and disconnect methods

  reload() {
    emit(ConferenceInitial());
    emit(ConferenceLoaded());
  }
}
