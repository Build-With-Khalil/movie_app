import 'package:flutter/material.dart';

import '../color/app_colors.dart';
import '../theme/theme_instances.dart';

class InterNetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const InterNetExceptionWidget({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .15,
          ),
          const Icon(
            Icons.cloud_off,
            color: AppColors.errorColor,
            size: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: Text(
                'We’re unable to show results.\nPlease check your data\nconnection.',
                textAlign: TextAlign.center,
                style: ThemeInstance(context).displayMedium!.copyWith(
                      fontSize: 20,
                    ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .15,
          ),
          ElevatedButton(
            onPressed: onPress,
            child: Center(
              child: Text(
                'RETRY',
                style: ThemeInstance(context).bodySmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}
