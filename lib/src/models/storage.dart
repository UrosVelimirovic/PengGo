class Storage {
  static String language = "English";
  static String country = "Russia";
  static String currentCharacter = "";

  static bool isFlipped = false;
  static Map<String, String> tts_lang = {
    "English": "en-US",
    "Spanish": "en-ES",
    "Russian": "ru-RU",
    "French": "fr-FR",
    "German": "de-DE",
    "Chinese": "zh-CN",
    "Serbian": "rs-RS"
  };

  static Map<String, String> country_to_lang = {
    "USA": "English",
    "France": "French",
    "Russia": "Russian",
    "Germany": "German",
    "China": "Chinese",
    "Japan": "Japanese",
    "Spain": "Spanish",
    "Serbia": "Serbian"
  };

  //                         ],
  Storage();

  // You can add more methods or properties here as needed
}
