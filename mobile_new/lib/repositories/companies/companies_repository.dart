part of '../repositories.dart';

class CompaniesRepository extends RepositoryInterface<CompaniesService> {
  factory CompaniesRepository() {
    return _singleton;
  }
  CompaniesRepository._internal();

  static final CompaniesRepository _singleton = CompaniesRepository._internal();

  static Future<Company?> checkIfEmailInCompany(String email) async {
    final response = await _singleton.service.checkIfEmailInCompany(email);
    if (response.isSuccessful) {
      final decodedResponse =
          jsonDecode(response.bodyString) as Map<String, dynamic>;

      final company = Company.fromJson(decodedResponse);

      await getIt
          .get<SessionManager>()
          .saveSession(email, apiUrl: company.apiUrl);

      return company;
    } else {
      await getIt.get<SessionManager>().saveSession(email);
      return null;
    }
  }

  static String getApiUrl() {
    final session = getIt.get<SessionManager>().getCurrentSession();
    // it should not fall to null, but who knows
    return session != null ? session.apiUrl : '';
  }
}
