class TCases {
  var cases;
  var deaths;
  var recovered;
  var todayCases;
  var todayDeaths;
  var active;
  var affectedCountries;
  var updated;
  var casesPerOneMillion;
  var deathsPerOneMillion;
  var tests;
  var testsPerOneMillion;

  TCases(
      {this.active,
      this.cases,
      this.deaths,
      this.recovered,
      this.affectedCountries,
      this.todayCases,
      this.todayDeaths,
      this.updated,
      this.tests,
      this.testsPerOneMillion,
      this.casesPerOneMillion,
      this.deathsPerOneMillion});

  factory TCases.fromJson(final json) {
    return TCases(
        cases: json["cases"],
        deaths: json["deaths"],
        recovered: json["recovered"],
        updated: json["updated"],
        active: json["active"],
        todayCases: json["todayCases"],
        todayDeaths: json["todayDeaths"],
        affectedCountries: json["affectedCountries"],
        tests: json["tests"],
        testsPerOneMillion: json["testsPerOneMillion"],
        casesPerOneMillion: json["casesPerOneMillion"],
        deathsPerOneMillion: json["deathsPerOneMillion"]);
  }
}
