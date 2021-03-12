class CaseFiguresApi {
  List<CaseFigures> caseFigures;

  CaseFiguresApi({this.caseFigures});

  factory CaseFiguresApi.fromJson(List<dynamic> json) {
    return CaseFiguresApi(
      caseFigures: List<CaseFigures>.from(json?.map((figure) {
        return CaseFigures(
          confirmCase: (figure["Number of confirmed cases"] == "") ? 0 : figure["Number of confirmed cases"],
          deathCase: (figure["Number of death cases"] == "") ? 0 : figure["Number of death cases"],
          dischargeCase: (figure["Number of discharge cases"] == "") ? 0 : figure["Number of discharge cases"],
          criticalCondition: (figure["Number of hospitalised cases in critical condition"] == "") ? 0 : figure["Number of hospitalised cases in critical condition"],
          date: figure["As of date"],
        );
      })),
    );
  }

}

class CaseFigures {
  int confirmCase, deathCase, dischargeCase, criticalCondition;
  String date;

  CaseFigures({this.confirmCase, this.deathCase, this.dischargeCase, this.criticalCondition, this.date});
}