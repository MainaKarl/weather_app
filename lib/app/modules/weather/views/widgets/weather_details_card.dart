import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/extensions.dart';
import '../../../../../config/translations/strings_enum.dart';
import '../../../../components/custom_cached_image.dart';
import '../../../../data/models/weather_details_model.dart';

class WeatherDetailsCard extends StatelessWidget {
  final WeatherDetailsModel weatherDetails;
  final DayForecast forecastDay;

  const WeatherDetailsCard({
    super.key,
    required this.weatherDetails,
    required this.forecastDay, required DayForecast forecast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    // Fallback values for null safety
    final locationName = weatherDetails.location?.name?.toRightCity() ?? "Unknown City";
    final countryName = forecastDay.city?.country?.toRightCountry() ?? "Unknown Country";
    final maxTemp = forecastDay.main?.tempMax?.toInt() ?? 0;
    final conditionText = forecastDay.weather?[0].description ?? "Unknown Condition";
    final iconUrl = 'http://openweathermap.org/img/wn/${forecastDay.weather?[0].icon}.png';
    'https://via.placeholder.com/150'; // Placeholder image

    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        children: [
          30.verticalSpace,
          CustomCachedImage(
            imageUrl: iconUrl,
            fit: BoxFit.cover,
            width: 150.w,
            height: 150.h,
            color: Colors.white,
          ),
          30.verticalSpace,
          Text(
            '$locationName, $countryName',
            style: theme.textTheme.displaySmall?.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          12.verticalSpace,
          Text(
            '$maxTemp${Strings.celsius.tr}',
            style: theme.textTheme.displaySmall?.copyWith(
              fontSize: 64.sp,
              color: Colors.white,
            ),
          ),
          16.verticalSpace,
          Text(
            conditionText,
            style: theme.textTheme.displaySmall?.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
