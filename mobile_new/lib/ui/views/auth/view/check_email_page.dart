// itt fogjuk megadni az emailt es ez majd szepen tovabbadja vagy a loginra vagy a regre azt
// siman bekerjuk az emailt
// majd lecsekkoljuk hogy valamelyik ceghez hozza van-e adva
// ha igen, akkor a ceg api url-je mentodik a sharedprefsbe es azt hasznalja majd az auth
// ha belepett akkor pedig a cubitba kerul at, igy lehet majd valtogatni

// ha nem tartozik ceghez, akkor marad az alap api url

import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/resources/routes/app_router.dart';
import 'package:blizz_chat/resources/services/connection/connection_service.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:blizz_chat/ui/views/auth/cubit/check/check_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@RoutePage()
class CheckEmailPage extends StatefulWidget {
  const CheckEmailPage({super.key});

  @override
  State<CheckEmailPage> createState() => _CheckEmailPageState();
}

class _CheckEmailPageState extends State<CheckEmailPage> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  _checkEmail(String email) async {
    final success = await context.read<AuthCubit>().hello();
    print('success: $success');
    if (success) {
      final companies = await context.read<CheckFormCubit>().checkEmail(email);
      if (companies != null && companies.isNotEmpty) {
        Company company;
        companies.add(
          Company(
            name: 'Blizz Chat (default)',
            apiUrl: dotenv.env['API_URL']!,
            members: [],
          ),
        );
        if (companies.length > 1) {
          company = (await showDialog<Company>(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return PopScope(
                canPop: false,
                child: AlertDialog(
                  title: const Text('Select Company'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...companies.map(
                        (company) {
                          bool isLoading = false;
                          String errorMessage = '';
                          return StatefulBuilder(
                            builder: (context, setState) => ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: Text(
                                company.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              onTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                final response = await getIt
                                    .get<ConnectionService>()
                                    .hello(baseUrl: company.apiUrl);
                                if (response) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.of(context).pop(company);
                                } else {
                                  setState(() {
                                    errorMessage =
                                        "This workspace/company is not available!";
                                    isLoading = false;
                                  });
                                }
                              },
                              trailing: isLoading
                                  ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                      ),
                                    )
                                  : null,
                              subtitle: errorMessage.isNotEmpty
                                  ? Text(
                                      errorMessage,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : null,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ))!;
        } else {
          company = companies.first;
        }
        await context.read<CheckFormCubit>().selectCompany(company, email);
      }
      // navigate to login
      context.router.replace(LoginRoute(email: email));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Server is not available. Try a different user/workspace or try again later.',
          ),
        ),
      );
      context.router.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CheckFormCubit, CheckFormState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                children: [
                  Text(
                    'Verification',
                    style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Please enter your email address',
                    style: TextStyle(fontSize: 20),
                  ),
                  AuthTextField(
                    obscure: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    onChanged: context.read<CheckFormCubit>().updateEmail,
                    errorText: state.emailError,
                    icon: const Icon(Icons.email),
                    hint: 'Email Address',
                  ),
                  ExpandedButton(
                    onTap:
                        state.isValid ? () => _checkEmail(state.email) : null,
                    text: 'Sign In',
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
