import 'package:flutter/material.dart';
import 'package:airly_monitor/utils/validation/validators_util.dart';

typedef ValidationRuleCallback = String? Function(String? value, BuildContext context);

class ValidationBuilder {
  final List<ValidationRuleCallback> rules = [];

  ValidationBuilder add(ValidationRuleCallback validator) {
    return this..rules.add(validator);
  }

  ValidationBuilder isValidEmail() => add(
        (text, context) =>
            ValidatorsUtil.isValidEmail(text) ? null : '', // AppLoc.of(context).validationRuleIsValidEmail,
      );

  ValidationBuilder isNotBlank() {
    return add(
      (text, context) => ValidatorsUtil.isNotBlank(text) ? null : '', // AppLoc.of(context).validationRuleNotBlank,
    );
  }

  String? build(String? text, BuildContext context) {
    for (final rule in rules) {
      final result = rule(text, context);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}
