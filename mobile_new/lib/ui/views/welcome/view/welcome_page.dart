import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late final AuthCubit _authCubit;
  late final UsersCubit _usersCubit;
  late final ChatsCubit _chatsCubit;
  late final MessagingCubit _messagingCubit;
  bool hasInit = false;

  @override
  initState() {
    super.initState();
    _authCubit = context.read<AuthCubit>();
    _usersCubit = context.read<UsersCubit>();
    _chatsCubit = context.read<ChatsCubit>();
    _messagingCubit = context.read<MessagingCubit>();
    // getIt.get<SharedPreferencesService>().preferences!.setString('token', '');
  }

  @override
  dispose() {
    print('welcome disposed');
    super.dispose();
  }

  void _initWs(AuthAuthenticated state) {
    if (!hasInit) {
      final token = state.userSession.token;
      print(token);
      _messagingCubit.connect(token);
      hasInit = true;
    }
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
                onPressed: () {
                  context.router.push(const LoginRoute());
                },
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
        // bloc: _authCubit,
        builder: (context, state) {
          if (state is AuthUnauthenticated) {
            return _renderWelcome();
          } else if (state is AuthAuthenticated) {
            context.router.replace(const HomeRoute());
            _initWs(state);
          }
          return const LoadingWidget();
        },
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            context.router.replace(const HomeRoute());
            _initWs(state);
          }
        },
      ),
    );
  }
}
