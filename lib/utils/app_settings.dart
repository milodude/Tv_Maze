class AppSettings {
  static String getConnectionString() {
    return 'api.tvmaze.com';
  }

  static Map<String, String> getHeader() {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*'
    };
  }
}
