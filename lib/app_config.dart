class AppConfig {


  static String baseurl="https://adinvoice";

  static String getapiurl(String endpoint)
  {
      return '$baseurl/$endpoint';
  }
}