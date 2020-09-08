class CaseApi {
  List<Case> caseList;

  CaseApi({this.caseList});

  factory CaseApi.fromJson(List<dynamic> json) {
    return CaseApi(
      caseList: List<Case>.from(json?.map((rawCase) {
        return Case(
          caseNumber: rawCase["Case no."],
          reportDate: rawCase["Report date"],
          dateOfOnset: rawCase["Date of onset"],
          gender: rawCase["gender"],
          age: rawCase["Age"],
          nameOfHospital: rawCase["Name of hospital admitted"],
          caseState: rawCase["Hospitalised/Discharged/Deceased"],
          resident: rawCase["HK/Non-HK resident"],
          classification: rawCase["Case classification*"],
          possibility: rawCase["Confirmed/probable"],
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