part of 'object_cubit.dart';

@immutable
sealed class ObjectState {}

final class ObjectInitial extends ObjectState {}

final class SetRecognation extends ObjectState {}

final class OnSelect extends ObjectState {}

final class InitCamera extends ObjectState {}
