// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class I10n {
  I10n();

  static I10n? _current;

  static I10n get current {
    assert(_current != null,
        'No instance of I10n was loaded. Try to initialize the I10n delegate before accessing I10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<I10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = I10n();
      I10n._current = instance;

      return instance;
    });
  }

  static I10n of(BuildContext context) {
    final instance = I10n.maybeOf(context);
    assert(instance != null,
        'No instance of I10n present in the widget tree. Did you add I10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static I10n? maybeOf(BuildContext context) {
    return Localizations.of<I10n>(context, I10n);
  }

  /// `Blizz Chat`
  String get appName {
    return Intl.message(
      'Blizz Chat',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `End-to-end encrypted messaging for everyone`
  String get premise {
    return Intl.message(
      'End-to-end encrypted messaging for everyone',
      name: 'premise',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueBtn {
    return Intl.message(
      'Continue',
      name: 'continueBtn',
      desc: '',
      args: [],
    );
  }

  /// `Welcome!`
  String get welcome {
    return Intl.message(
      'Welcome!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Failed to sign in`
  String get failedToSignIn {
    return Intl.message(
      'Failed to sign in',
      name: 'failedToSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Please log in to your account`
  String get pleaseLogIn {
    return Intl.message(
      'Please log in to your account',
      name: 'pleaseLogIn',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get emailAddress {
    return Intl.message(
      'Email address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Not a member yet?`
  String get notMemberYet {
    return Intl.message(
      'Not a member yet?',
      name: 'notMemberYet',
      desc: '',
      args: [],
    );
  }

  /// `Already a member?`
  String get alreadyMember {
    return Intl.message(
      'Already a member?',
      name: 'alreadyMember',
      desc: '',
      args: [],
    );
  }

  /// `Register now`
  String get registerNow {
    return Intl.message(
      'Register now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Failed to sign up`
  String get failedToSignUp {
    return Intl.message(
      'Failed to sign up',
      name: 'failedToSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Welcome newcomer!`
  String get welcomeNew {
    return Intl.message(
      'Welcome newcomer!',
      name: 'welcomeNew',
      desc: '',
      args: [],
    );
  }

  /// `Please register an account`
  String get pleaseRegister {
    return Intl.message(
      'Please register an account',
      name: 'pleaseRegister',
      desc: '',
      args: [],
    );
  }

  /// `Login now`
  String get loginNow {
    return Intl.message(
      'Login now',
      name: 'loginNow',
      desc: '',
      args: [],
    );
  }

  /// `Before using the app:\nWhat's your name?`
  String get personalStep1 {
    return Intl.message(
      'Before using the app:\nWhat\'s your name?',
      name: 'personalStep1',
      desc: '',
      args: [],
    );
  }

  /// `Email is missing`
  String get emailMissing {
    return Intl.message(
      'Email is missing',
      name: 'emailMissing',
      desc: '',
      args: [],
    );
  }

  /// `Password is missing`
  String get passwordMissing {
    return Intl.message(
      'Password is missing',
      name: 'passwordMissing',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password is missing`
  String get confirmPasswordMissing {
    return Intl.message(
      'Confirm password is missing',
      name: 'confirmPasswordMissing',
      desc: '',
      args: [],
    );
  }

  /// `Name is missing`
  String get nameMissing {
    return Intl.message(
      'Name is missing',
      name: 'nameMissing',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Invalid form`
  String get invalidForm {
    return Intl.message(
      'Invalid form',
      name: 'invalidForm',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get chats {
    return Intl.message(
      'Chats',
      name: 'chats',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `User successfully added`
  String get userAddSuccess {
    return Intl.message(
      'User successfully added',
      name: 'userAddSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to add user`
  String get userAddFail {
    return Intl.message(
      'Failed to add user',
      name: 'userAddFail',
      desc: '',
      args: [],
    );
  }

  /// `Use the search field to find new contacts`
  String get addContactsGuide {
    return Intl.message(
      'Use the search field to find new contacts',
      name: 'addContactsGuide',
      desc: '',
      args: [],
    );
  }

  /// `No users found!`
  String get noUsersFound {
    return Intl.message(
      'No users found!',
      name: 'noUsersFound',
      desc: '',
      args: [],
    );
  }

  /// `Chat successfully deleted`
  String get chatDeleteSuccess {
    return Intl.message(
      'Chat successfully deleted',
      name: 'chatDeleteSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to delete chat`
  String get chatDeleteFail {
    return Intl.message(
      'Failed to delete chat',
      name: 'chatDeleteFail',
      desc: '',
      args: [],
    );
  }

  /// `Mark as read`
  String get markAsRead {
    return Intl.message(
      'Mark as read',
      name: 'markAsRead',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get archive {
    return Intl.message(
      'Archive',
      name: 'archive',
      desc: '',
      args: [],
    );
  }

  /// `Mute`
  String get mute {
    return Intl.message(
      'Mute',
      name: 'mute',
      desc: '',
      args: [],
    );
  }

  /// `No chats found!`
  String get noChatsFound {
    return Intl.message(
      'No chats found!',
      name: 'noChatsFound',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Contact successfully deleted`
  String get contactDeleteSuccess {
    return Intl.message(
      'Contact successfully deleted',
      name: 'contactDeleteSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to delete contact`
  String get contactDeleteFail {
    return Intl.message(
      'Failed to delete contact',
      name: 'contactDeleteFail',
      desc: '',
      args: [],
    );
  }

  /// `Block`
  String get block {
    return Intl.message(
      'Block',
      name: 'block',
      desc: '',
      args: [],
    );
  }

  /// `No contacts found!`
  String get noContactsFound {
    return Intl.message(
      'No contacts found!',
      name: 'noContactsFound',
      desc: '',
      args: [],
    );
  }

  /// `Chat successfully added`
  String get chatAddSuccess {
    return Intl.message(
      'Chat successfully added',
      name: 'chatAddSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to add chat`
  String get chatAddFail {
    return Intl.message(
      'Failed to add chat',
      name: 'chatAddFail',
      desc: '',
      args: [],
    );
  }

  /// `New Message`
  String get newMessage {
    return Intl.message(
      'New Message',
      name: 'newMessage',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Stories`
  String get stories {
    return Intl.message(
      'Stories',
      name: 'stories',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `User successfully updated`
  String get userUpdateSuccess {
    return Intl.message(
      'User successfully updated',
      name: 'userUpdateSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update user`
  String get userUpdateFail {
    return Intl.message(
      'Failed to update user',
      name: 'userUpdateFail',
      desc: '',
      args: [],
    );
  }

  /// `Darkmode`
  String get darkMode {
    return Intl.message(
      'Darkmode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `on`
  String get on {
    return Intl.message(
      'on',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// `off`
  String get off {
    return Intl.message(
      'off',
      name: 'off',
      desc: '',
      args: [],
    );
  }

  /// `Save changes`
  String get saveChanges {
    return Intl.message(
      'Save changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Message something`
  String get messageSomething {
    return Intl.message(
      'Message something',
      name: 'messageSomething',
      desc: '',
      args: [],
    );
  }

  /// `Create your story`
  String get createYourStory {
    return Intl.message(
      'Create your story',
      name: 'createYourStory',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get confirmation {
    return Intl.message(
      'Confirmation',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Story successfully deleted`
  String get storyDeleteSuccess {
    return Intl.message(
      'Story successfully deleted',
      name: 'storyDeleteSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to delete story`
  String get storyDeleteFail {
    return Intl.message(
      'Failed to delete story',
      name: 'storyDeleteFail',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `Hungarian`
  String get hu {
    return Intl.message(
      'Hungarian',
      name: 'hu',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hu'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I10n> load(Locale locale) => I10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
