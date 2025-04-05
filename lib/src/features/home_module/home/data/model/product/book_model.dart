class BookModel {
  final Record? records;
  final List<Items>? items;

  BookModel({
    required this.records,
    required this.items,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        records:
            json['records'] != null ? Record.fromJson(json['records']) : null,
        items: (json['items'] as List<dynamic>?)
                ?.map((e) => Items.fromJson(e))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        'records': records?.toJson(),
        'items': items?.toList(),
      };
}

class Record {
  final BooksOL2842220M? booksOL2842220M;

  Record({
    required this.booksOL2842220M,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        booksOL2842220M: json['/books/OL2842220M'] != null
            ? BooksOL2842220M.fromJson(json['/books/OL2842220M'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        '/books/OL2842220M': booksOL2842220M?.toJson(),
      };
}

class BooksOL2842220M {
  final List<String>? isbns;
  final List<String>? issns;
  final List<String>? lccns;
  final List<String>? oclcs;
  final List<String>? olids;
  final List<String>? publishDates;
  final String? recordURL;
  final Data? data;
  final Details? details;

  BooksOL2842220M({
    required this.isbns,
    required this.issns,
    required this.lccns,
    required this.oclcs,
    required this.olids,
    required this.publishDates,
    required this.recordURL,
    required this.data,
    required this.details,
  });

  factory BooksOL2842220M.fromJson(Map<String, dynamic> json) =>
      BooksOL2842220M(
        isbns: (json['isbns'] as List<dynamic>?)?.cast<String>().toList() ?? [],
        issns: (json['issns'] as List<dynamic>?)?.cast<String>().toList() ?? [],
        lccns: (json['lccns'] as List<dynamic>?)?.cast<String>().toList() ?? [],
        oclcs: (json['oclcs'] as List<dynamic>?)?.cast<String>().toList() ?? [],
        olids: (json['olids'] as List<dynamic>?)?.cast<String>().toList() ?? [],
        publishDates:
            (json['publishDates'] as List<dynamic>?)?.cast<String>().toList() ??
                [],
        recordURL: json['recordURL'] ?? '',
        data: json['data'] != null ? Data.fromJson(json['data']) : null,
        details:
            json['details'] != null ? Details.fromJson(json['details']) : null,
      );

  Map<String, dynamic> toJson() => {
        'isbns': isbns?.toList(),
        'issns': issns?.toList(),
        'lccns': lccns?.toList(),
        'oclcs': oclcs?.toList(),
        'olids': olids?.toList(),
        'publishDates': publishDates?.toList(),
        'recordURL': recordURL,
        'data': data?.toJson(),
        'details': details?.toJson(),
      };
}

class Data {
  final String? url;
  final String? key;
  final List<DataAuthors>? authors;
  final int? number_of_pages;
  final String? pagination;
  final String? by_statement;
  final List<DataIdentifiers>? identifiers;
  final List<Classifications>? classifications;
  final List<Publishers>? publishers;
  final String? publish_date;
  final List<Subjects>? subjects;
  final String? notes;
  final List<Ebooks>? ebooks;

  Data({
    required this.url,
    required this.key,
    required this.authors,
    required this.number_of_pages,
    required this.pagination,
    required this.by_statement,
    required this.identifiers,
    required this.classifications,
    required this.publishers,
    required this.publish_date,
    required this.subjects,
    required this.notes,
    required this.ebooks,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        url: json['url'] ?? '',
        key: json['key'] ?? '',
        authors: (json['authors'] as List<dynamic>?)
                ?.map((e) => DataAuthors.fromJson(e))
                .toList() ??
            [],
        number_of_pages: json['number_of_pages'] ?? 0,
        pagination: json['pagination'] ?? '',
        by_statement: json['by_statement'] ?? '',
        identifiers: (json['identifiers'] as List<dynamic>?)
                ?.map((e) => DataIdentifiers.fromJson(e))
                .toList() ??
            [],
        classifications: (json['classifications'] as List<dynamic>?)
                ?.map((e) => Classifications.fromJson(e))
                .toList() ??
            [],
        publishers: (json['publishers'] as List<dynamic>?)
                ?.map((e) => Publishers.fromJson(e))
                .toList() ??
            [],
        publish_date: json['publish_date'] ?? '',
        subjects: (json['subjects'] as List<dynamic>?)
                ?.map((e) => Subjects.fromJson(e))
                .toList() ??
            [],
        notes: json['notes'] ?? '',
        ebooks: (json['ebooks'] as List<dynamic>?)
                ?.map((e) => Ebooks.fromJson(e))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'key': key,
        'authors': authors?.toList(),
        'number_of_pages': number_of_pages,
        'pagination': pagination,
        'by_statement': by_statement,
        'identifiers': identifiers?.toList(),
        'classifications': classifications?.toList(),
        'publishers': publishers?.toList(),
        'publish_date': publish_date,
        'subjects': subjects?.toList(),
        'notes': notes,
        'ebooks': ebooks?.toList(),
      };
}

class DataAuthors {
  final String? url;
  final String? name;

  DataAuthors({
    required this.url,
    required this.name,
  });

  factory DataAuthors.fromJson(Map<String, dynamic> json) => DataAuthors(
        url: json['url'] ?? '',
        name: json['name'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'name': name,
      };
}

class DataIdentifiers {
  final List<String>? librarything;
  final List<String>? goodreads;
  final List<String>? isbn_10;
  final List<String>? isbn_13;
  final List<String>? lccn;
  final List<String>? oclc;
  final List<String>? openlibrary;

  DataIdentifiers({
    required this.librarything,
    required this.goodreads,
    required this.isbn_10,
    required this.isbn_13,
    required this.lccn,
    required this.oclc,
    required this.openlibrary,
  });

  factory DataIdentifiers.fromJson(Map<String, dynamic> json) =>
      DataIdentifiers(
        librarything:
            (json['librarything'] as List<dynamic>?)?.cast<String>().toList() ??
                [],
        goodreads:
            (json['goodreads'] as List<dynamic>?)?.cast<String>().toList() ??
                [],
        isbn_10:
            (json['isbn_10'] as List<dynamic>?)?.cast<String>().toList() ?? [],
        isbn_13:
            (json['isbn_13'] as List<dynamic>?)?.cast<String>().toList() ?? [],
        lccn: (json['lccn'] as List<dynamic>?)?.cast<String>().toList() ?? [],
        oclc: (json['oclc'] as List<dynamic>?)?.cast<String>().toList() ?? [],
        openlibrary:
            (json['openlibrary'] as List<dynamic>?)?.cast<String>().toList() ??
                [],
      );

  Map<String, dynamic> toJson() => {
        'librarything': librarything?.toList(),
        'goodreads': goodreads?.toList(),
        'isbn_10': isbn_10?.toList(),
        'isbn_13': isbn_13?.toList(),
        'lccn': lccn?.toList(),
        'oclc': oclc?.toList(),
        'openlibrary': openlibrary?.toList(),
      };
}

class Classifications {
  final List<String>? lc_classifications;
  final List<String>? dewey_decimal_class;

  Classifications({
    required this.lc_classifications,
    required this.dewey_decimal_class,
  });

  factory Classifications.fromJson(Map<String, dynamic> json) =>
      Classifications(
        lc_classifications: (json['lc_classifications'] as List<dynamic>?)
                ?.cast<String>()
                .toList() ??
            [],
        dewey_decimal_class: (json['dewey_decimal_class'] as List<dynamic>?)
                ?.cast<String>()
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        'lc_classifications': lc_classifications?.toList(),
        'dewey_decimal_class': dewey_decimal_class?.toList(),
      };
}

class Publishers {
  final String? name;

  Publishers({
    required this.name,
  });

  factory Publishers.fromJson(Map<String, dynamic> json) => Publishers(
        name: json['name'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}

class PublishPlaces {
  final String? name;

  PublishPlaces({
    required this.name,
  });

  factory PublishPlaces.fromJson(Map<String, dynamic> json) => PublishPlaces(
        name: json['name'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}

class Subjects {
  final String? name;
  final String? url;

  Subjects({
    required this.name,
    required this.url,
  });

  factory Subjects.fromJson(Map<String, dynamic> json) => Subjects(
        name: json['name'] ?? '',
        url: json['url'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}

class Ebooks {
  final String? preview_url;
  final String? availability;
  final Formats? formats;
  final String? borrow_url;
  final String? checkedout;
  final Cover? cover;

  Ebooks({
    required this.preview_url,
    required this.availability,
    required this.formats,
    required this.borrow_url,
    required this.checkedout,
    required this.cover,
  });

  factory Ebooks.fromJson(Map<String, dynamic> json) => Ebooks(
        preview_url: json['preview_url'] ?? '',
        availability: json['availability'] ?? '',
        formats:
            json['formats'] != null ? Formats.fromJson(json['formats']) : null,
        borrow_url: json['borrow_url'] ?? '',
        checkedout: json['checkedout'] ?? '',
        cover: json['cover'] != null ? Cover.fromJson(json['cover']) : null,
      );

  Map<String, dynamic> toJson() => {
        'preview_url': preview_url,
        'availability': availability,
        'formats': formats?.toJson(),
        'borrow_url': borrow_url,
        'checkedout': checkedout,
        'cover': cover?.toJson(),
      };
}

class Formats {
  Formats();

  factory Formats.fromJson(Map<String, dynamic> json) => Formats();

  Map<String, dynamic> toJson() => {};
}

class Details {
  final String? bib_key;
  final String? info_url;
  final String? preview;
  final String? preview_url;
  final String? thumbnail_url;
  final Details1? details;

  Details({
    required this.bib_key,
    required this.info_url,
    required this.preview,
    required this.preview_url,
    required this.thumbnail_url,
    required this.details,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        bib_key: json['bib_key'] ?? '',
        info_url: json['info_url'] ?? '',
        preview: json['preview'] ?? '',
        preview_url: json['preview_url'] ?? '',
        thumbnail_url: json['thumbnail_url'] ?? '',
        details:
            json['details'] != null ? Details1.fromJson(json['details']) : null,
      );

  Map<String, dynamic> toJson() => {
        'bib_key': bib_key,
        'info_url': info_url,
        'preview': preview,
        'preview_url': preview_url,
        'thumbnail_url': thumbnail_url,
        'details': details?.toJson(),
      };
}

class Details1 {
  final List<String>? publishers;
  final int? number_of_pages;
  final List<String>? ia_box_id;
  final List<Links>? links;
  final List<String>? isbn_10;
  final List<int>? covers;
  final String? full_title;
  final List<String>? lc_classifications;
  final String? key;
  final List<DetailsAuthors>? authors;
  final String? ocaid;
  final List<String>? publish_places;
  final Description? description;
  final List<Languages>? languages;
  final String? pagination;
  final List<String>? source_records;
  final String? title;
  final List<String>? dewey_decimal_class;
  final Notes? notes;
  final DetailsIdentifiers? identifiers;
  final List<String>? isbn_13;
  final String? edition_name;
  final List<String>? lccn;
  final List<String>? subjects;
  final String? publish_date;
  final String? publish_country;
  final String? by_statement;
  final List<String>? oclc_numbers;
  final List<Works>? works;
  final Type? type;
  final int? latest_revision;
  final int? revision;
  final Created? created;
  final LastModified? last_modified;

  Details1({
    required this.publishers,
    required this.number_of_pages,
    required this.ia_box_id,
    required this.links,
    required this.isbn_10,
    required this.covers,
    required this.full_title,
    required this.lc_classifications,
    required this.key,
    required this.authors,
    required this.ocaid,
    required this.publish_places,
    required this.description,
    required this.languages,
    required this.pagination,
    required this.source_records,
    required this.title,
    required this.dewey_decimal_class,
    required this.notes,
    required this.identifiers,
    required this.isbn_13,
    required this.edition_name,
    required this.lccn,
    required this.subjects,
    required this.publish_date,
    required this.publish_country,
    required this.by_statement,
    required this.oclc_numbers,
    required this.works,
    required this.type,
    required this.latest_revision,
    required this.revision,
    required this.created,
    required this.last_modified,
  });

  factory Details1.fromJson(Map<String, dynamic> json) => Details1(
        publishers:
            (json['publishers'] as List<dynamic>?)?.cast<String>().toList() ??
                [],
        number_of_pages: json['number_of_pages'] ?? 0,
        ia_box_id:
            (json['ia_box_id'] as List<dynamic>?)?.cast<String>().toList() ??
                [],
        links: (json['links'] as List<dynamic>?)
                ?.map((e) => Links.fromJson(e))
                .toList() ??
            [],
        isbn_10:
            (json['isbn_10'] as List<dynamic>?)?.cast<String>().toList() ?? [],
        covers: (json['covers'] as List<dynamic>?)?.cast<int>().toList() ?? [],
        full_title: json['full_title'] ?? '',
        lc_classifications: (json['lc_classifications'] as List<dynamic>?)
                ?.cast<String>()
                .toList() ??
            [],
        key: json['key'] ?? '',
        authors: (json['authors'] as List<dynamic>?)
                ?.map((e) => DetailsAuthors.fromJson(e))
                .toList() ??
            [],
        ocaid: json['ocaid'] ?? '',
        publish_places: (json['publish_places'] as List<dynamic>?)
                ?.cast<String>()
                .toList() ??
            [],
        description: json['description'] != null
            ? Description.fromJson(json['description'])
            : null,
        languages: (json['languages'] as List<dynamic>?)
                ?.map((e) => Languages.fromJson(e))
                .toList() ??
            [],
        pagination: json['pagination'] ?? '',
        source_records: (json['source_records'] as List<dynamic>?)
                ?.cast<String>()
                .toList() ??
            [],
        title: json['title'] ?? '',
        dewey_decimal_class: (json['dewey_decimal_class'] as List<dynamic>?)
                ?.cast<String>()
                .toList() ??
            [],
        notes: json['notes'] != null ? Notes.fromJson(json['notes']) : null,
        identifiers: json['identifiers'] != null
            ? DetailsIdentifiers.fromJson(json['identifiers'])
            : null,
        isbn_13:
            (json['isbn_13'] as List<dynamic>?)?.cast<String>().toList() ?? [],
        edition_name: json['edition_name'] ?? '',
        lccn: (json['lccn'] as List<dynamic>?)?.cast<String>().toList() ?? [],
        subjects:
            (json['subjects'] as List<dynamic>?)?.cast<String>().toList() ?? [],
        publish_date: json['publish_date'] ?? '',
        publish_country: json['publish_country'] ?? '',
        by_statement: json['by_statement'] ?? '',
        oclc_numbers:
            (json['oclc_numbers'] as List<dynamic>?)?.cast<String>().toList() ??
                [],
        works: (json['works'] as List<dynamic>?)
                ?.map((e) => Works.fromJson(e))
                .toList() ??
            [],
        type: json['type'] != null ? Type.fromJson(json['type']) : null,
        latest_revision: json['latest_revision'] ?? 0,
        revision: json['revision'] ?? 0,
        created:
            json['created'] != null ? Created.fromJson(json['created']) : null,
        last_modified: json['last_modified'] != null
            ? LastModified.fromJson(json['last_modified'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'publishers': publishers?.toList(),
        'number_of_pages': number_of_pages,
        'ia_box_id': ia_box_id?.toList(),
        'links': links?.toList(),
        'isbn_10': isbn_10?.toList(),
        'covers': covers?.toList(),
        'full_title': full_title,
        'lc_classifications': lc_classifications?.toList(),
        'key': key,
        'authors': authors?.toList(),
        'ocaid': ocaid,
        'publish_places': publish_places?.toList(),
        'description': description?.toJson(),
        'languages': languages?.toList(),
        'pagination': pagination,
        'source_records': source_records?.toList(),
        'title': title,
        'dewey_decimal_class': dewey_decimal_class?.toList(),
        'notes': notes?.toJson(),
        'identifiers': identifiers?.toJson(),
        'isbn_13': isbn_13?.toList(),
        'edition_name': edition_name,
        'lccn': lccn?.toList(),
        'subjects': subjects?.toList(),
        'publish_date': publish_date,
        'publish_country': publish_country,
        'by_statement': by_statement,
        'oclc_numbers': oclc_numbers?.toList(),
        'works': works?.toList(),
        'type': type?.toJson(),
        'latest_revision': latest_revision,
        'revision': revision,
        'created': created?.toJson(),
        'last_modified': last_modified?.toJson(),
      };
}

class Links {
  final String? url;

  Links({
    required this.url,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        url: json['url'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'url': url,
      };
}

class DetailsAuthors {
  final String? key;
  final String? name;

  DetailsAuthors({
    required this.key,
    required this.name,
  });

  factory DetailsAuthors.fromJson(Map<String, dynamic> json) => DetailsAuthors(
        key: json['key'] ?? '',
        name: json['name'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'name': name,
      };
}

class Description {
  final String? type;
  final String? value;

  Description({
    required this.type,
    required this.value,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        type: json['type'] ?? '',
        value: json['value'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
      };
}

class Languages {
  final String? key;

  Languages({
    required this.key,
  });

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        key: json['key'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'key': key,
      };
}

class Notes {
  final String? type;
  final String? value;

  Notes({
    required this.type,
    required this.value,
  });

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        type: json['type'] ?? '',
        value: json['value'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
      };
}

class DetailsIdentifiers {
  final List<String>? librarything;
  final List<String>? goodreads;

  DetailsIdentifiers({
    required this.librarything,
    required this.goodreads,
  });

  factory DetailsIdentifiers.fromJson(Map<String, dynamic> json) =>
      DetailsIdentifiers(
        librarything:
            (json['librarything'] as List<dynamic>?)?.cast<String>().toList() ??
                [],
        goodreads:
            (json['goodreads'] as List<dynamic>?)?.cast<String>().toList() ??
                [],
      );

  Map<String, dynamic> toJson() => {
        'librarything': librarything?.toList(),
        'goodreads': goodreads?.toList(),
      };
}

class Works {
  final String? key;

  Works({
    required this.key,
  });

  factory Works.fromJson(Map<String, dynamic> json) => Works(
        key: json['key'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'key': key,
      };
}

class Type {
  final String? key;

  Type({
    required this.key,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        key: json['key'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'key': key,
      };
}

class Created {
  final String? type;
  final String? value;

  Created({
    required this.type,
    required this.value,
  });

  factory Created.fromJson(Map<String, dynamic> json) => Created(
        type: json['type'] ?? '',
        value: json['value'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
      };
}

class LastModified {
  final String? type;
  final String? value;

  LastModified({
    required this.type,
    required this.value,
  });

  factory LastModified.fromJson(Map<String, dynamic> json) => LastModified(
        type: json['type'] ?? '',
        value: json['value'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
      };
}

class Items {
  final String? enumcron;
  final String? match;
  final String? status;
  final String? fromRecord;
  final String? olEditionId;
  final String? olWorkId;
  final String? publishDate;
  final String? contributor;
  final String? itemURL;
  final Cover? cover;

  Items({
    required this.enumcron,
    required this.match,
    required this.status,
    required this.fromRecord,
    required this.olEditionId,
    required this.olWorkId,
    required this.publishDate,
    required this.contributor,
    required this.itemURL,
    required this.cover,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        enumcron: json['enumcron'] ?? '',
        match: json['match'] ?? '',
        status: json['status'] ?? '',
        fromRecord: json['fromRecord'] ?? '',
        olEditionId: json['olEditionId'] ?? '',
        olWorkId: json['olWorkId'] ?? '',
        publishDate: json['publishDate'] ?? '',
        contributor: json['contributor'] ?? '',
        itemURL: json['itemURL'] ?? '',
        cover: json['cover'] != null ? Cover.fromJson(json['cover']) : null,
      );

  Map<String, dynamic> toJson() => {
        'enumcron': enumcron,
        'match': match,
        'status': status,
        'fromRecord': fromRecord,
        'olEditionId': olEditionId,
        'olWorkId': olWorkId,
        'publishDate': publishDate,
        'contributor': contributor,
        'itemURL': itemURL,
        'cover': cover?.toJson(),
      };
}

class Cover {
  final String? small;
  final String? medium;
  final String? large;

  Cover({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
        small: json['small'] ?? '',
        medium: json['medium'] ?? '',
        large: json['large'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'small': small,
        'medium': medium,
        'large': large,
      };
}

class Model {
  final int? int1;
  final double? double2;
  final String? String3;
  final bool? bool4;
  final String? null5;
  final List<String>? list6;
  final Map7? map7;
  final List<ListOfObjects8>? listOfObjects8;
  final NestedMap9? nestedMap9;

  Model({
    this.int1,
    this.double2,
    this.String3,
    this.bool4,
    this.null5,
    this.list6,
    this.map7,
    this.listOfObjects8,
    this.nestedMap9,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        int1: json['int1'] ?? 1,
        double2: json['double2'] ?? 1.0,
        String3: json['String3'] ?? 'Khalil',
        bool4: json['bool4'] ?? true & false,
        null5: json['null5'] ?? null,
        list6: (json['list6'] as List<dynamic>?)?.cast<String>().toList() ?? [],
        map7: json['map7'] != null ? Map7.fromJson(json['map7']) : null,
        listOfObjects8: (json['listOfObjects8'] as List<dynamic>?)
                ?.map((e) => ListOfObjects8.fromJson(e))
                .toList() ??
            [],
        nestedMap9: json['nestedMap9'] != null
            ? NestedMap9.fromJson(json['nestedMap9'])
            : null,
      );

  Map<String, dynamic> toMap() => {
        'int1': int1,
        'double2': double2,
        'String3': String3,
        'bool4': bool4,
        'null5': null5,
        'list6': list6?.toList(),
        'map7': map7?.toJson(),
        'listOfObjects8': listOfObjects8?.toList(),
        'nestedMap9': nestedMap9?.toJson(),
      };
}

class Map7 {
  final String? key;
  final String? key1;

  Map7({
    this.key,
    this.key1,
  });

  factory Map7.fromJson(Map<String, dynamic> json) => Map7(
        key: json['key'] ?? '',
        key1: json['key1'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'key1': key1,
      };
}

class ListOfObjects8 {
  final String? name;

  ListOfObjects8({
    this.name,
  });

  factory ListOfObjects8.fromJson(Map<String, dynamic> json) => ListOfObjects8(
        name: json['name'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}

class NestedMap9 {
  final InnerMap1? innerMap1;
  final InnerMap2? innerMap2;

  NestedMap9({
    this.innerMap1,
    this.innerMap2,
  });

  factory NestedMap9.fromJson(Map<String, dynamic> json) => NestedMap9(
        innerMap1: json['innerMap1'] != null
            ? InnerMap1.fromJson(json['innerMap1'])
            : null,
        innerMap2: json['innerMap2'] != null
            ? InnerMap2.fromJson(json['innerMap2'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'innerMap1': innerMap1?.toJson(),
        'innerMap2': innerMap2?.toJson(),
      };
}

class InnerMap1 {
  final int? id;
  final String? name;

  InnerMap1({
    required this.id,
    required this.name,
  });

  factory InnerMap1.fromJson(Map<String, dynamic> json) => InnerMap1(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class InnerMap2 {
  final int? id;
  final String? name;

  InnerMap2({
    required this.id,
    required this.name,
  });

  factory InnerMap2.fromJson(Map<String, dynamic> json) => InnerMap2(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

// Map<String, dynamic> toMap() => {
//       'int1': 1,
//       'double2': 1.0,
//       'String3': 'Khalil',
//       'bool4': true & false,
//       'null5': null,
//       'list6': [
//         'Khalil',
//         'Asif',
//         'Kamran',
//       ],
//       'map7': {
//         'key': 'value',
//         'key1': 'value',
//       },
//       'listOfObjects8': [
//         {'name': 'khalil'},
//         {'name': 'khalil'},
//       ],
//       'nestedMap9': {
//         'innerMap1': {'id': 1, 'name': 'John'},
//         'innerMap2': {'id': 2, 'name': 'Doe'},
//       }
//     };
