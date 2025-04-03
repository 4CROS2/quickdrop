import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_locations_state.dart';

class MyLocationsCubit extends Cubit<MyLocationsState> {
  MyLocationsCubit() : super(MyLocationsInitial());
}
