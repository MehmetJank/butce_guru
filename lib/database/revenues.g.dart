// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenues.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRevenuesCollection on Isar {
  IsarCollection<Revenues> get revenues => this.collection();
}

const RevenuesSchema = CollectionSchema(
  name: r'Revenues',
  id: -346829559020900818,
  properties: {
    r'revenueAmount': PropertySchema(
      id: 0,
      name: r'revenueAmount',
      type: IsarType.double,
    ),
    r'revenueDate': PropertySchema(
      id: 1,
      name: r'revenueDate',
      type: IsarType.string,
    ),
    r'revenueDescription': PropertySchema(
      id: 2,
      name: r'revenueDescription',
      type: IsarType.string,
    ),
    r'revenueSource': PropertySchema(
      id: 3,
      name: r'revenueSource',
      type: IsarType.string,
    ),
    r'revenueTitle': PropertySchema(
      id: 4,
      name: r'revenueTitle',
      type: IsarType.string,
    )
  },
  estimateSize: _revenuesEstimateSize,
  serialize: _revenuesSerialize,
  deserialize: _revenuesDeserialize,
  deserializeProp: _revenuesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _revenuesGetId,
  getLinks: _revenuesGetLinks,
  attach: _revenuesAttach,
  version: '3.0.5',
);

int _revenuesEstimateSize(
  Revenues object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.revenueDate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.revenueDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.revenueSource;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.revenueTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _revenuesSerialize(
  Revenues object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.revenueAmount);
  writer.writeString(offsets[1], object.revenueDate);
  writer.writeString(offsets[2], object.revenueDescription);
  writer.writeString(offsets[3], object.revenueSource);
  writer.writeString(offsets[4], object.revenueTitle);
}

Revenues _revenuesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Revenues();
  object.id = id;
  object.revenueAmount = reader.readDoubleOrNull(offsets[0]);
  object.revenueDate = reader.readStringOrNull(offsets[1]);
  object.revenueDescription = reader.readStringOrNull(offsets[2]);
  object.revenueSource = reader.readStringOrNull(offsets[3]);
  object.revenueTitle = reader.readStringOrNull(offsets[4]);
  return object;
}

P _revenuesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _revenuesGetId(Revenues object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _revenuesGetLinks(Revenues object) {
  return [];
}

void _revenuesAttach(IsarCollection<dynamic> col, Id id, Revenues object) {
  object.id = id;
}

extension RevenuesQueryWhereSort on QueryBuilder<Revenues, Revenues, QWhere> {
  QueryBuilder<Revenues, Revenues, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RevenuesQueryWhere on QueryBuilder<Revenues, Revenues, QWhereClause> {
  QueryBuilder<Revenues, Revenues, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Revenues, Revenues, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterWhereClause> idBetween(
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

extension RevenuesQueryFilter
    on QueryBuilder<Revenues, Revenues, QFilterCondition> {
  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'revenueAmount',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'revenueAmount',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueAmountEqualTo(
    double? value, {
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueAmountGreaterThan(
    double? value, {
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueAmountLessThan(
    double? value, {
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueAmountBetween(
    double? lower,
    double? upper, {
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'revenueDate',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'revenueDate',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueDateEqualTo(
    String? value, {
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueDateGreaterThan(
    String? value, {
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueDateLessThan(
    String? value, {
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueDateBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueDateStartsWith(
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueDateEndsWith(
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueDateContains(
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueDateMatches(
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'revenueDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'revenueDescription',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'revenueDescription',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueDescriptionEqualTo(
    String? value, {
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueDescriptionGreaterThan(
    String? value, {
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueDescriptionLessThan(
    String? value, {
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueDescriptionBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
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

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'revenueDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'revenueDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'revenueDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueSourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'revenueSource',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueSourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'revenueSource',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueSourceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueSourceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revenueSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueSourceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revenueSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueSourceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revenueSource',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueSourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'revenueSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueSourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'revenueSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueSourceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'revenueSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueSourceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'revenueSource',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueSourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueSource',
        value: '',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueSourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'revenueSource',
        value: '',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'revenueTitle',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'revenueTitle',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueTitleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueTitleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revenueTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueTitleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revenueTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueTitleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revenueTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'revenueTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'revenueTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueTitleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'revenueTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition> revenueTitleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'revenueTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterFilterCondition>
      revenueTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'revenueTitle',
        value: '',
      ));
    });
  }
}

extension RevenuesQueryObject
    on QueryBuilder<Revenues, Revenues, QFilterCondition> {}

extension RevenuesQueryLinks
    on QueryBuilder<Revenues, Revenues, QFilterCondition> {}

extension RevenuesQuerySortBy on QueryBuilder<Revenues, Revenues, QSortBy> {
  QueryBuilder<Revenues, Revenues, QAfterSortBy> sortByRevenueAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.asc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> sortByRevenueAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.desc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> sortByRevenueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueDate', Sort.asc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> sortByRevenueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueDate', Sort.desc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> sortByRevenueDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueDescription', Sort.asc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy>
      sortByRevenueDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueDescription', Sort.desc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> sortByRevenueSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueSource', Sort.asc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> sortByRevenueSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueSource', Sort.desc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> sortByRevenueTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueTitle', Sort.asc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> sortByRevenueTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueTitle', Sort.desc);
    });
  }
}

extension RevenuesQuerySortThenBy
    on QueryBuilder<Revenues, Revenues, QSortThenBy> {
  QueryBuilder<Revenues, Revenues, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> thenByRevenueAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.asc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> thenByRevenueAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.desc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> thenByRevenueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueDate', Sort.asc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> thenByRevenueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueDate', Sort.desc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> thenByRevenueDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueDescription', Sort.asc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy>
      thenByRevenueDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueDescription', Sort.desc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> thenByRevenueSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueSource', Sort.asc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> thenByRevenueSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueSource', Sort.desc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> thenByRevenueTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueTitle', Sort.asc);
    });
  }

  QueryBuilder<Revenues, Revenues, QAfterSortBy> thenByRevenueTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueTitle', Sort.desc);
    });
  }
}

extension RevenuesQueryWhereDistinct
    on QueryBuilder<Revenues, Revenues, QDistinct> {
  QueryBuilder<Revenues, Revenues, QDistinct> distinctByRevenueAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenueAmount');
    });
  }

  QueryBuilder<Revenues, Revenues, QDistinct> distinctByRevenueDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenueDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Revenues, Revenues, QDistinct> distinctByRevenueDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenueDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Revenues, Revenues, QDistinct> distinctByRevenueSource(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenueSource',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Revenues, Revenues, QDistinct> distinctByRevenueTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenueTitle', caseSensitive: caseSensitive);
    });
  }
}

extension RevenuesQueryProperty
    on QueryBuilder<Revenues, Revenues, QQueryProperty> {
  QueryBuilder<Revenues, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Revenues, double?, QQueryOperations> revenueAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenueAmount');
    });
  }

  QueryBuilder<Revenues, String?, QQueryOperations> revenueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenueDate');
    });
  }

  QueryBuilder<Revenues, String?, QQueryOperations>
      revenueDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenueDescription');
    });
  }

  QueryBuilder<Revenues, String?, QQueryOperations> revenueSourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenueSource');
    });
  }

  QueryBuilder<Revenues, String?, QQueryOperations> revenueTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenueTitle');
    });
  }
}
