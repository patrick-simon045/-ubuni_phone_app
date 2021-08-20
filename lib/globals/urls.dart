// base url
final baseUrl = "https://www.paa.ubuni.co.tz";

// lists all phones
final phoneListEndpoint = "$baseUrl/phones";

// details for a single phone
String phoneDetailEndpoint({
  required String phoneListEndpoint,
  required int phoneId,
}) {
  return "$phoneListEndpoint/$phoneId";
}
