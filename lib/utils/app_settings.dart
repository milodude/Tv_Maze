///Class to store all connection strings
class AppSettings {
  ///Method for getting the connection string for maze app tv API
  static String getConnectionString() {
    return 'api.tvmaze.com';
  }
  ///Method that allos you to get a header for a request
  static Map<String, String> getHeader() {
    return <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*'
    };
  }
}
