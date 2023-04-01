// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRevenueCollection on Isar {
  IsarCollection<Revenue> get revenues => this.collection();
}

const RevenueSchema = CollectionSchema(
  name: r'Revenue',
  id: -749704011775570183,
  properties: {
    r'revenueAmount': PropertySchema(
      id: 0,
      name: r'revenueAmount',
      type: IsarType.double,
    ),
    r'revenueCategory': PropertySchema(
      id: 1,
      name: r'revenueCategory',
      type: IsarType.string,
    ),
    r'revenueDate': PropertySchema(
      id: 2,
      name: r'revenueDate',
      type: IsarType.string,
    ),
    r'revenueDescription': PropertySchema(
      id: 3,
      name: r'revenueDescription',
      type: IsarType.string,
    ),
    r'revenueName': PropertySchema(
      id: 4,
      name: r'revenueName',
      type: IsarType.string,
    )
  },
  estimateSize: _revenueEstimateSize,
  serialize: _revenueSerialize,
  deserialize: _revenueDeserialize,
  deserializeProp: _revenueDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _revenueGetId,
  getLinks: _revenueGetLinks,
  attach: _revenueAttach,
  version: '3.0.5',
);

int _revenueEstimateSize(
  Revenue object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.revenueCategory.length * 3;
  bytesCount += 3 + object.revenueDate.length * 3;
  bytesCount += 3 + object.revenueDescription.length * 3;
  bytesCount += 3 + object.revenueName.length * 3;
  return bytesCount;
}

void _revenueSerialize(
  Revenue object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.revenueAmount);
  writer.writeString(offsets[1], object.revenueCategory);
  writer.writeString(offsets[2], object.revenueDate);
  writer.writeString(offsets[3], object.revenueDescription);
  writer.writeString(offsets[4], object.revenueName);
}

Revenue _revenueDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Revenue(
    revenueAmount: reader.readDouble(offsets[0]),
    revenueCategory: reader.readString(offsets[1]),
    revenueDate: reader.readString(offsets[2]),
    revenueDescription: reader.readString(offsets[3]),
    revenueName: reader.readString(offsets[4]),
  );
  object.id = id;
  return object;
}

P _revenueDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _revenueGetId(Revenue object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _revenueGetLinks(Revenue object) {
  return [];
}

void _revenueAttach(IsarCollection<dynamic> col, Id id, Revenue object) {
  object.id = id;
}

extension RevenueQueryWhereSort on QueryBuilder<Revenue, Revenue, QWhere> {
  QueryBuilder<Revenue, Revenue, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RevenueQueryWhere on QueryBuilder<Revenue, Revenue, QWhereClause> {
  QueryBuilder<Revenue, Revenue, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RevenueQueryFilter
    on QueryBuilder<Revenue, Revenue, QFilterCondition> {
  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revenueAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revenueAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revenueAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueCategoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueCategoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revenueCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueCategoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revenueCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueCategoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revenueCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'revenueCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'revenueCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueCategoryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'revenueCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueCategoryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'revenueCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'revenueCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revenueDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revenueDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revenueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'revenueDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'revenueDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'revenueDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'revenueDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'revenueDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueDescriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueDescriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revenueDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueDescriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revenueDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueDescriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revenueDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'revenueDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'revenueDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'revenueDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'revenueDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'revenueDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revenueName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revenueName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revenueName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'revenueName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'revenueName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'revenueName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'revenueName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition> revenueNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueName',
        value: '',
      ));
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterFilterCondition>
      revenueNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'revenueName',
        value: '',
      ));
    });
  }
}

extension RevenueQueryObject
    on QueryBuilder<Revenue, Revenue, QFilterCondition> {}

extension RevenueQueryLinks
    on QueryBuilder<Revenue, Revenue, QFilterCondition> {}

extension RevenueQuerySortBy on QueryBuilder<Revenue, Revenue, QSortBy> {
  QueryBuilder<Revenue, Revenue, QAfterSortBy> sortByRevenueAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.asc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> sortByRevenueAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.desc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> sortByRevenueCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueCategory', Sort.asc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> sortByRevenueCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueCategory', Sort.desc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> sortByRevenueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueDate', Sort.asc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> sortByRevenueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueDate', Sort.desc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> sortByRevenueDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueDescription', Sort.asc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> sortByRevenueDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueDescription', Sort.desc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> sortByRevenueName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueName', Sort.asc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> sortByRevenueNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueName', Sort.desc);
    });
  }
}

extension RevenueQuerySortThenBy
    on QueryBuilder<Revenue, Revenue, QSortThenBy> {
  QueryBuilder<Revenue, Revenue, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> thenByRevenueAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.asc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> thenByRevenueAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.desc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> thenByRevenueCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueCategory', Sort.asc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> thenByRevenueCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueCategory', Sort.desc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> thenByRevenueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueDate', Sort.asc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> thenByRevenueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueDate', Sort.desc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> thenByRevenueDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueDescription', Sort.asc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> thenByRevenueDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueDescription', Sort.desc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> thenByRevenueName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueName', Sort.asc);
    });
  }

  QueryBuilder<Revenue, Revenue, QAfterSortBy> thenByRevenueNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueName', Sort.desc);
    });
  }
}

extension RevenueQueryWhereDistinct
    on QueryBuilder<Revenue, Revenue, QDistinct> {
  QueryBuilder<Revenue, Revenue, QDistinct> distinctByRevenueAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenueAmount');
    });
  }

  QueryBuilder<Revenue, Revenue, QDistinct> distinctByRevenueCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenueCategory',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Revenue, Revenue, QDistinct> distinctByRevenueDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenueDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Revenue, Revenue, QDistinct> distinctByRevenueDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenueDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Revenue, Revenue, QDistinct> distinctByRevenueName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenueName', caseSensitive: caseSensitive);
    });
  }
}

extension RevenueQueryProperty
    on QueryBuilder<Revenue, Revenue, QQueryProperty> {
  QueryBuilder<Revenue, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Revenue, double, QQueryOperations> revenueAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenueAmount');
    });
  }

  QueryBuilder<Revenue, String, QQueryOperations> revenueCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenueCategory');
    });
  }

  QueryBuilder<Revenue, String, QQueryOperations> revenueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenueDate');
    });
  }

  QueryBuilder<Revenue, String, QQueryOperations> revenueDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenueDescription');
    });
  }

  QueryBuilder<Revenue, String, QQueryOperations> revenueNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenueName');
    });
  }
}
