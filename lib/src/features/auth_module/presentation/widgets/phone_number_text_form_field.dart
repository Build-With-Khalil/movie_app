import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/component/custom_icon.dart';
import '../../../../core/component/custom_text_form_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_string.dart';
import '../../../../core/utils/theme/theme_instances.dart';
import '../../../../core/utils/validation/validation.dart';

class PhoneNumberTextFormField extends StatefulWidget {
  final TextEditingController phoneNumberController;

  const PhoneNumberTextFormField(
      {super.key, required this.phoneNumberController});

  @override
  _PhoneNumberTextFormFieldState createState() =>
      _PhoneNumberTextFormFieldState();
}

class _PhoneNumberTextFormFieldState extends State<PhoneNumberTextFormField> {
  late FocusNode phoneNumberFocusNode;

  @override
  void initState() {
    super.initState();
    phoneNumberFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.phoneNumberController,
      hintText: AppStrings.phoneNumber,
      hintStyle: ThemeInstance(context).titleMedium!.apply(
            color: AppColors.grey,
          ),
      prefixIcon: const CustomIcon(
        icon: Iconsax.sms,
      ),
      focusNode: phoneNumberFocusNode,
      onChanged: (value) {},
      onFieldSubmitted: (value) {},
      keyboardType: TextInputType.number,
      validator: (value) => AppValidators.emptyFieldValidate(
        '$value',
      ),
      txtColor: AppColors.black,
      borderColor: AppColors.grey,
      focusedBorderColor: AppColors.primary,
    );
  }

  @override
  void dispose() {
    phoneNumberFocusNode.dispose();
    super.dispose();
  }
}
