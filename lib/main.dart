import 'package:boxigo_sample_app/bloc/sample_bloc.dart';
import 'package:boxigo_sample_app/lead_page.dart';
import 'package:boxigo_sample_app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BlocProvider(
        create: (context) =>
            SampleDataBloc(Repository())..add(FetchSampleDataEvent()),
        child: const LeadsPage(),
      ),
    );
  }
}
