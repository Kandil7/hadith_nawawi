
class Book {
  final int id;
  final Metadata metadata;
  final List<Chapter> chapters;
  final List<Hadith> hadiths;

  Book({
    required this.id,
    required this.metadata,
    required this.chapters,
    required this.hadiths,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      metadata: Metadata.fromJson(json['metadata']),
      chapters: (json['chapters'] as List)
          .map((e) => Chapter.fromJson(e))
          .toList(),
      hadiths: (json['hadiths'] as List)
          .map((e) => Hadith.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'metadata': metadata.toJson(),
      'chapters': chapters.map((e) => e.toJson()).toList(),
      'hadiths': hadiths.map((e) => e.toJson()).toList(),
    };
  }
}

class Metadata {
  final int id;
  final int length;
  final ArabicMetadata arabic;
  final EnglishMetadata english;

  Metadata({
    required this.id,
    required this.length,
    required this.arabic,
    required this.english,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      id: json['id'],
      length: json['length'],
      arabic: ArabicMetadata.fromJson(json['arabic']),
      english: EnglishMetadata.fromJson(json['english']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'length': length,
      'arabic': arabic.toJson(),
      'english': english.toJson(),
    };
  }
}

class ArabicMetadata {
  final String title;
  final String author;
  final String introduction;

  ArabicMetadata({
    required this.title,
    required this.author,
    required this.introduction,
  });

  factory ArabicMetadata.fromJson(Map<String, dynamic> json) {
    return ArabicMetadata(
      title: json['title'],
      author: json['author'],
      introduction: json['introduction'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'introduction': introduction,
    };
  }
}

class EnglishMetadata {
  final String title;
  final String author;
  final String introduction;

  EnglishMetadata({
    required this.title,
    required this.author,
    required this.introduction,
  });

  factory EnglishMetadata.fromJson(Map<String, dynamic> json) {
    return EnglishMetadata(
      title: json['title'],
      author: json['author'],
      introduction: json['introduction'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'introduction': introduction,
    };
  }
}

class Chapter {
  final int id;
  final int bookId;
  final String arabic;
  final String english;

  Chapter({
    required this.id,
    required this.bookId,
    required this.arabic,
    required this.english,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      id: json['id'],
      bookId: json['bookId'],
      arabic: json['arabic'],
      english: json['english'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bookId': bookId,
      'arabic': arabic,
      'english': english,
    };
  }
}

class Hadith {
  final int id;
  final int idInBook;
  final int chapterId;
  final int bookId;
  final String arabic;
  final EnglishHadith english;

  Hadith({
    required this.id,
    required this.idInBook,
     this.chapterId=0,
     this.bookId=10,
    required this.arabic,
    required this.english,
  });

  factory Hadith.fromJson(Map<String, dynamic> json) {
    return Hadith(
      id: json['id'],
      idInBook: json['idInBook'],
      chapterId: json['chapterId'],
      bookId: json['bookId'],
      arabic: json['arabic'],
      english: EnglishHadith.fromJson(json['english']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idInBook': idInBook,
      'chapterId': chapterId,
      'bookId': bookId,
      'arabic': arabic,
      'english': english.toJson(),
    };
  }
}

class EnglishHadith {
  final String narrator;
  final String text;

  EnglishHadith({
    required this.narrator,
    required this.text,
  });

  factory EnglishHadith.fromJson(Map<String, dynamic> json) {
    return EnglishHadith(
      narrator: json['narrator'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'narrator': narrator,
      'text': text,
    };
  }
}
