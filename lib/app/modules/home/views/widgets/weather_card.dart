import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/extensions.dart';
import '../../../../../config/translations/strings_enum.dart';
import '../../../../components/custom_cached_image.dart';
import '../../../../data/models/weather_model.dart';
import '../../../../routes/app_pages.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;
  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    // Extract data from the Current model
    final current = weather.current;
    final location = weather.location;

    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.WEATHER,
        arguments: '${location.lat},${location.lon}',
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  Text(
                    location.name?.toRightCountry() ?? "Unknown Country",
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  8.verticalSpace,
                  Text(
                    current.weatherMain.toRightCity() ?? "Unknown City",
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  20.verticalSpace,
                  Text(
                    // Using wind speed as an alternative to the "condition"
                    'Description: ${current.weatherDescription}',
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ).animate().slideX(
                duration: 200.ms,
                begin: -1,
                curve: Curves.easeInSine,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${current.temp?.round() ?? 0}${Strings.celsius.tr}', // Fallback value for temperature
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ).animate().slideX(
              duration: 200.ms,
              begin: 1,
              curve: Curves.easeInSine,
            ),
          ],
        ),
      ),
    );
  }
}
