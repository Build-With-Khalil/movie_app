class WordModel {
  final String? word;
  final List<Phonetics>? phonetics;
  final List<Meanings>? meanings;
  final License? license;
  final List<String>? sourceUrls;

  WordModel({
    this.word,
    this.phonetics,
    this.meanings,
    this.license,
    this.sourceUrls,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) => WordModel(
        word: json['word'] ?? '',
        phonetics: (json['phonetics'] as List<dynamic>?)
                ?.map((e) => Phonetics.fromJson(e))
                .toList() ??
            [],
        meanings: (json['meanings'] as List<dynamic>?)
                ?.map((e) => Meanings.fromJson(e))
                .toList() ??
            [],
        license:
            json['license'] != null ? License.fromJson(json['license']) : null,
        sourceUrls:
            (json['sourceUrls'] as List<dynamic>?)?.cast<String>() ?? [],
      );

  Map<String, dynamic> toJson() => {
        'word': word,
        'phonetics': phonetics?.toList(),
        'meanings': meanings?.toList(),
        'license': license?.toJson(),
        'sourceUrls': sourceUrls?.toList(),
      };
}

class Phonetics {
  final String? text;
  final String? audio;
  final String? sourceUrl;
  final License? license;

  Phonetics({
    this.text,
    this.audio,
    this.sourceUrl,
    this.license,
  });

  factory Phonetics.fromJson(Map<String, dynamic> json) => Phonetics(
        text: json['text'] ?? '',
        audio: json['audio'] ?? '',
        sourceUrl: json['sourceUrl'] ?? '',
        license:
            json['license'] != null ? License.fromJson(json['license']) : null,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'audio': audio,
        'sourceUrl': sourceUrl,
        'license': license?.toJson(),
      };
}

class Meanings {
  final String? partOfSpeech;
  final List<Definitions>? definitions;
  final List<String>? synonyms;
  final List<String>? antonyms;

  Meanings({
    this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.antonyms,
  });

  factory Meanings.fromJson(Map<String, dynamic> json) => Meanings(
        partOfSpeech: json['partOfSpeech'] ?? '',
        definitions: (json['definitions'] as List<dynamic>?)
                ?.map((e) => Definitions.fromJson(e))
                .toList() ??
            [],
        synonyms: (json['synonyms'] as List<dynamic>?)?.cast<String>() ?? [],
        antonyms: (json['antonyms'] as List<dynamic>?)?.cast<String>() ?? [],
      );

  Map<String, dynamic> toJson() => {
        'partOfSpeech': partOfSpeech,
        'definitions': definitions?.toList(),
        'synonyms': synonyms?.toList(),
        'antonyms': antonyms?.toList(),
      };
}

class License {
  final String? name;
  final String? url;

  License({
    this.name,
    this.url,
  });

  factory License.fromJson(Map<String, dynamic> json) => License(
        name: json['name'] ?? '',
        url: json['url'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}

class Definitions {
  final String? definition;
  final String? example;
  final List<String>? synonyms;
  final List<String>? antonyms;

  Definitions({
    this.definition,
    this.example,
    this.synonyms,
    this.antonyms,
  });

  factory Definitions.fromJson(Map<String, dynamic> json) => Definitions(
        definition: json['definition'] ?? '',
        example: json['example'] ?? '',
        synonyms: (json['synonyms'] as List<dynamic>?)?.cast<String>() ?? [],
        antonyms: (json['antonyms'] as List<dynamic>?)?.cast<String>() ?? [],
      );

  Map<String, dynamic> toJson() => {
        'definition': definition,
        'example': example,
        'synonyms': synonyms?.toList(),
        'antonyms': antonyms?.toList(),
      };
}
