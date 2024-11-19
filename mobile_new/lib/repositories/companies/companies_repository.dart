part of '../repositories.dart';

class CompaniesRepository extends RepositoryInterface<CompaniesService> {
  factory CompaniesRepository() {
    return _singleton;
  }
  CompaniesRepository._internal();

  static final CompaniesRepository _singleton = CompaniesRepository._internal();

  static Future<List<Company>?> checkIfEmailInCompany(String email) async {
    print('eljutunk egyaltalan ide?');
    final response = await _singleton.service.checkIfEmailInCompany(email);

    if (response.isSuccessful && response.bodyString.isNotEmpty) {
      print('itt jarunk?');
      final decodedResponse = jsonDecode(response.bodyString);
      print(decodedResponse);
      final companyList = (decodedResponse as List<dynamic>)
          .map((company) => Company.fromJson(company as Map<String, dynamic>))
          .toList();
      if (companyList.isEmpty) {
        await getIt.get<SessionManager>().saveSession(email);
        await getIt.get<SessionManager>().setActiveSession(email);
        return null;
      }
      return companyList;
    } else {
      print('saving session with no company');
      await getIt.get<SessionManager>().saveSession(email);
      await getIt.get<SessionManager>().setActiveSession(email);
      return null;
    }
  }

  static Future<void> selectCompany(Company company, String email) async {
    await getIt
        .get<SessionManager>()
        .saveSession(email, apiUrl: company.apiUrl, companyName: company.name);

    await getIt
        .get<SessionManager>()
        .setActiveSession(email, apiUrl: company.apiUrl);
  }

  static String getApiUrl() {
    final session = getIt.get<SessionManager>().getCurrentSession();
    // it should not fall to null, but who knows
    return session != null ? session.apiUrl : '${dotenv.env['API_URL']}';
  }
}
