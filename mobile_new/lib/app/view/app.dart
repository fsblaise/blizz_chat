import 'package:blizz_chat/l10n/l10n.dart';
import 'package:blizz_chat/repositories/repositories.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:blizz_chat/ui/views/auth/cubit/check/check_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CheckFormCubit()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => LoginFormCubit()),
        BlocProvider(create: (_) => RegisterFormCubit()),
        BlocProvider(create: (_) => ChatsCubit()),
        BlocProvider(create: (_) => UsersCubit()),
      ],
      child: Builder(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => MessagingCubit(
                  context.read<ChatsCubit>(),
                  context.read<UsersCubit>(),
                ),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                ),
                useMaterial3: true,
              ),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: MaterialApp.router(
                theme: ThemeData(
                  appBarTheme: AppBarTheme(
                    backgroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                  ),
                  useMaterial3: true,
                ),
                debugShowCheckedModeBanner: false,
                routerConfig: appRouter.config(),
              ),
            ),
          );
        },
      ),
    );
  }
}
