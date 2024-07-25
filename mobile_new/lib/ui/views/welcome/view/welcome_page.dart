import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:blizz_chat/ui/views/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _authCubit = AuthCubit();

  @override
  initState() {
    super.initState();
    // getIt.get<SharedPreferencesService>().preferences!.setString('token', '');
    getIt.get<SharedPreferencesService>().preferences!.setString('token',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2Njk5MDQwYWM1ZDk1OWVkZWFiM2I5YjEiLCJlbWFpbCI6ImFzZDJAZ21haWwuY29tIiwiaWF0IjoxNzIxOTE3MTY1LCJleHAiOjE3MjIwMDM1NjV9.hroIPjPJsPNh5LI7quHUR3n3ZjMby4cHaNtIkJ6jeXg');
  }

  Widget _renderLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _renderWelcome() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.chat,
            size: 169,
            color: Colors.deepPurple,
          ),
          const Text(
            'Blizz Chat',
            style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'End-to-end encrypted messaging for everyone',
            style: TextStyle(fontSize: 26),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: const ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(Size(120, 40)),
                ),
                child: const Text('Continue'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        bloc: _authCubit,
        builder: (context, state) {
          if (state is AuthUnauthenticated) {
            return _renderWelcome();
          }
          return _renderLoading();
        },
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            context.router.replace(const HomeRoute());
          }
        },
      ),
    );
  }
}
