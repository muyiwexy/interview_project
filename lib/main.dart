import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_project/features/3_score_app/presentation/bloc/incident_bloc/incident_bloc.dart';
import 'package:interview_project/features/3_score_app/presentation/bloc/match_data_bloc/match_data_bloc.dart';
import 'package:interview_project/features/3_score_app/presentation/pages/root_layout.dart';
import 'package:interview_project/injection_container.dart';

void main() async {
  InjectionContainer().init();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<IncidentBloc>(
        create: (BuildContext context) => serviceLocator<IncidentBloc>(),
      ),
      BlocProvider<MatchDataBloc>(
        create: (BuildContext context) => serviceLocator<MatchDataBloc>(),
      ),
    ], child: const ThreeScore(child: RootLayout())),
  );
}

class ThreeScore extends StatefulWidget {
  final Widget child;
  const ThreeScore({super.key, required this.child});

  @override
  State<ThreeScore> createState() => _ThreeScoreState();
}

class _ThreeScoreState extends State<ThreeScore> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: widget.child,
    );
  }
}
