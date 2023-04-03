// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetExpensesCollection on Isar {
  IsarCollection<Expenses> get expenses => this.collection();
}

const ExpensesSchema = CollectionSchema(
  name: r'Expenses',
  id: -4428151000743579409,
  properties: {
    r'bankName': PropertySchema(
      id: 0,
      name: r'bankName',
      type: IsarType.string,
    ),
    r'expenseAmount': PropertySchema(
      id: 1,
      name: r'expenseAmount',
      type: IsarType.double,
    ),
    r'expenseCategory': PropertySchema(
      id: 2,
      name: r'expenseCategory',
      type: IsarType.string,
    ),
    r'expenseDate': PropertySchema(
      id: 3,
      name: r'expenseDate',
      type: IsarType.string,
    ),
    r'expenseDescription': PropertySchema(
      id: 4,
      name: r'expenseDescription',
      type: IsarType.string,
    ),
    r'expenseTitle': PropertySchema(
      id: 5,
      name: r'expenseTitle',
      type: IsarType.string,
    ),
    r'paymentMethod': PropertySchema(
      id: 6,
      name: r'paymentMethod',
      type: IsarType.string,
    )
  },
  estimateSize: _expensesEstimateSize,
  serialize: _expensesSerialize,
  deserialize: _expensesDeserialize,
  deserializeProp: _expensesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _expensesGetId,
  getLinks: _expensesGetLinks,
  attach: _expensesAttach,
  version: '3.0.5',
);

int _expensesEstimateSize(
  Expenses object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bankName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.expenseCategory;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.expenseDate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.expenseDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.expenseTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.paymentMethod;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _expensesSerialize(
  Expenses object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bankName);
  writer.writeDouble(offsets[1], object.expenseAmount);
  writer.writeString(offsets[2], object.expenseCategory);
  writer.writeString(offsets[3], object.expenseDate);
  writer.writeString(offsets[4], object.expenseDescription);
  writer.writeString(offsets[5], object.expenseTitle);
  writer.writeString(offsets[6], object.paymentMethod);
}

Expenses _expensesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Expenses();
  object.bankName = reader.readStringOrNull(offsets[0]);
  object.expenseAmount = reader.readDoubleOrNull(offsets[1]);
  object.expenseCategory = reader.readStringOrNull(offsets[2]);
  object.expenseDate = reader.readStringOrNull(offsets[3]);
  object.expenseDescription = reader.readStringOrNull(offsets[4]);
  object.expenseTitle = reader.readStringOrNull(offsets[5]);
  object.id = id;
  object.paymentMethod = reader.readStringOrNull(offsets[6]);
  return object;
}

P _expensesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _expensesGetId(Expenses object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _expensesGetLinks(Expenses object) {
  return [];
}

void _expensesAttach(IsarCollection<dynamic> col, Id id, Expenses object) {
  object.id = id;
}

extension ExpensesQueryWhereSort on QueryBuilder<Expenses, Expenses, QWhere> {
  QueryBuilder<Expenses, Expenses, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ExpensesQueryWhere on QueryBuilder<Expenses, Expenses, QWhereClause> {
  QueryBuilder<Expenses, Expenses, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Expenses, Expenses, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterWhereClause> idBetween(
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

extension ExpensesQueryFilter
    on QueryBuilder<Expenses, Expenses, QFilterCondition> {
  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> bankNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bankName',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> bankNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bankName',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> bankNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> bankNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> bankNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> bankNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bankName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> bankNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> bankNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> bankNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> bankNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bankName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> bankNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> bankNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenseAmount',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenseAmount',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseCategoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenseCategory',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseCategoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenseCategory',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseCategoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseCategoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseCategoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseCategoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expenseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expenseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expenseCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expenseCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expenseCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenseDate',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenseDate',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expenseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expenseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expenseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expenseDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expenseDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenseDescription',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenseDescription',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expenseDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expenseDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expenseDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expenseDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expenseDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenseTitle',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenseTitle',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseTitleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseTitleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseTitleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseTitleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expenseTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expenseTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseTitleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expenseTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseTitleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expenseTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expenseTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      paymentMethodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paymentMethod',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      paymentMethodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paymentMethod',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> paymentMethodEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      paymentMethodGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> paymentMethodLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> paymentMethodBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      paymentMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> paymentMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> paymentMethodContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> paymentMethodMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      paymentMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      paymentMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }
}

extension ExpensesQueryObject
    on QueryBuilder<Expenses, Expenses, QFilterCondition> {}

extension ExpensesQueryLinks
    on QueryBuilder<Expenses, Expenses, QFilterCondition> {}

extension ExpensesQuerySortBy on QueryBuilder<Expenses, Expenses, QSortBy> {
  QueryBuilder<Expenses, Expenses, QAfterSortBy> sortByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> sortByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> sortByExpenseAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseAmount', Sort.asc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> sortByExpenseAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseAmount', Sort.desc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> sortByExpenseCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseCategory', Sort.asc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> sortByExpenseCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseCategory', Sort.desc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> sortByExpenseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseDate', Sort.asc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> sortByExpenseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseDate', Sort.desc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> sortByExpenseDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseDescription', Sort.asc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy>
      sortByExpenseDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseDescription', Sort.desc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> sortByExpenseTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseTitle', Sort.asc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> sortByExpenseTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseTitle', Sort.desc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> sortByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> sortByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }
}

extension ExpensesQuerySortThenBy
    on QueryBuilder<Expenses, Expenses, QSortThenBy> {
  QueryBuilder<Expenses, Expenses, QAfterSortBy> thenByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> thenByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> thenByExpenseAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseAmount', Sort.asc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> thenByExpenseAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseAmount', Sort.desc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> thenByExpenseCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseCategory', Sort.asc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> thenByExpenseCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseCategory', Sort.desc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> thenByExpenseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseDate', Sort.asc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> thenByExpenseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseDate', Sort.desc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> thenByExpenseDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseDescription', Sort.asc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy>
      thenByExpenseDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseDescription', Sort.desc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> thenByExpenseTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseTitle', Sort.asc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> thenByExpenseTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseTitle', Sort.desc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> thenByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterSortBy> thenByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }
}

extension ExpensesQueryWhereDistinct
    on QueryBuilder<Expenses, Expenses, QDistinct> {
  QueryBuilder<Expenses, Expenses, QDistinct> distinctByBankName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bankName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Expenses, Expenses, QDistinct> distinctByExpenseAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenseAmount');
    });
  }

  QueryBuilder<Expenses, Expenses, QDistinct> distinctByExpenseCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenseCategory',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Expenses, Expenses, QDistinct> distinctByExpenseDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenseDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Expenses, Expenses, QDistinct> distinctByExpenseDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenseDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Expenses, Expenses, QDistinct> distinctByExpenseTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenseTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Expenses, Expenses, QDistinct> distinctByPaymentMethod(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentMethod',
          caseSensitive: caseSensitive);
    });
  }
}

extension ExpensesQueryProperty
    on QueryBuilder<Expenses, Expenses, QQueryProperty> {
  QueryBuilder<Expenses, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Expenses, String?, QQueryOperations> bankNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankName');
    });
  }

  QueryBuilder<Expenses, double?, QQueryOperations> expenseAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenseAmount');
    });
  }

  QueryBuilder<Expenses, String?, QQueryOperations> expenseCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenseCategory');
    });
  }

  QueryBuilder<Expenses, String?, QQueryOperations> expenseDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenseDate');
    });
  }

  QueryBuilder<Expenses, String?, QQueryOperations>
      expenseDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenseDescription');
    });
  }

  QueryBuilder<Expenses, String?, QQueryOperations> expenseTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenseTitle');
    });
  }

  QueryBuilder<Expenses, String?, QQueryOperations> paymentMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentMethod');
    });
  }
}
