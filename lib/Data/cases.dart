class CaseApi {
  List<Case> caseList;

  CaseApi({this.caseList});

  factory CaseApi.fromJson(List<dynamic> json) {
    return CaseApi(
      caseList: List<Case>.from(json?.map((rawCase) {
        return Case(
          caseNumber: int.parse(rawCase["Case no."]),
          reportDate: rawCase["Report date"].toString(),
          dateOfOnset: rawCase["Date of onset"].toString(),
          gender: rawCase["Gender"].toString(),
          age: rawCase["Age"],
          nameOfHospital: rawCase["Name of hospital admitted"].toString(),
          caseState: rawCase["Hospitalised/Discharged/Deceased"].toString(),
          resident: rawCase["HK/Non-HK resident"].toString(),
          classification: rawCase["Case classification*"].toString(),
          possibility: rawCase["Confirmed/probable"].toString(),
        );
      })),
    );
  }
}


class Case {
  int caseNumber, age;
  String reportDate, dateOfOnset, gender, caseState, resident, classification, possibility, nameOfHospital;

  Case({this.caseNumber, this.age, this.reportDate, this.dateOfOnset, this.gender, this.caseState, this.resident, this.classification, this.nameOfHospital, this.possibility});
}