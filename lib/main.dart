import 'package:citytech/my_app.dart';
import 'package:citytech/ui/home/bloc/tickets_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Builder(
    builder: (context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<TicketsBloc>(
            create: (context) => TicketsBloc(),
          ),
        ],
        child: const MyApp(),
      );
    },
  ));
}
