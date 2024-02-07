import 'package:blizz_chat/features/core/application/language_controller.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/l10n/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final I10n _i10n = locator<I10n>();

class LanguageSelectorWidget extends ConsumerWidget {
  const LanguageSelectorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = ref.watch(languageControllerProvider);
    return lang.when(
        data: (language) {
          language ??= Localizations.localeOf(context);
          return TextButton(
            onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(_i10n.language),
                      content: SingleChildScrollView(
                        child: Column(
                            children: L10nUtils.all
                                .map((e) => CheckboxListTile(
                                      value: language?.languageCode.contains(e.languageCode),
                                      onChanged: (value) {
                                        ref.read(languageControllerProvider.notifier).setLocale(e);
                                        language = e;
                                      },
                                      title: Text(L10nUtils.getLanguage(e.languageCode)),
                                      checkboxShape: const CircleBorder(),
                                    ))
                                .toList()),
                      ),
                    )),
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  const Icon(Icons.logout),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    _i10n.language,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
        error: (e, s) => Center(child: Text(_i10n.somethingWentWrong)),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
