import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

import '../../../../utils/extensions.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/api_error_widget.dart';
import '../../../components/custom_icon_button.dart';
import '../../../components/my_widgets_animator.dart';
import '../controllers/weather_controller.dart';
import 'widgets/forecast_hour_item.dart';
import 'widgets/sun_rise_set_item.dart';
import 'widgets/weather_details_card.dart';
import 'widgets/weather_details_item.dart';
import 'widgets/weather_row_data.dart';

class WeatherView extends GetView<WeatherController> {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<WeatherController>(
          builder: (_) => MyWidgetsAnimator(
            apiCallStatus: controller.apiCallStatus,
            loadingWidget: () => const Center(child: CircularProgressIndicator()),
            errorWidget: () => ApiErrorWidget(
              retryAction: () => controller.getWeatherDetails(),
            ),
            successWidget: () => SingleChildScrollView(
              child: Column(
                children: [
                  30.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                          backgroundColor: theme.primaryColor,
                        ),
                        PopupMenuButton<String>(
                          onSelected: controller.onDaySelected,
                          color: theme.cardColor,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context) => controller.weatherDetails.forecast.forecastday.map((fd) {
                            return PopupMenuItem<String>(
                              value: fd.date.convertToDay(),
                              child: Text(
                                fd.date.convertToDay(),
                                style: theme.textTheme.displaySmall,
                              ),
                            );
                          }).toList(),
                          child: Container(
                            height: 50.h,
                            padding: EdgeInsetsDirectional.only(start: 8.w),
                            decoration: BoxDecoration(
                              color: theme.canvasColor,
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(controller.selectedDay, style: theme.textTheme.bodyLarge),
                                8.horizontalSpace,
                                CustomIconButton(
                                  onPressed: null,
                                  icon: SvgPicture.asset(
                                    Constants.downArrow,
                                    fit: BoxFit.none,
                                  ),
                                  backgroundColor: theme.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  24.verticalSpace,
                  AspectRatio(
                    aspectRatio: 0.99,
                    child: PageView.builder(
                      controller: controller.pageController,
                      physics: const ClampingScrollPhysics(),
                      onPageChanged: controller.onCardSlided,
                      itemCount: controller.weatherDetails.forecast.forecastday.length,
                      itemBuilder: (context, index) {
                        final forecastDay = controller.weatherDetails.forecast.forecastday[index];
                        return WeatherDetailsCard(
                          weatherDetails: controller.weatherDetails,
                          forecastDay: forecastDay,
                        );
                      },
                    ),
                  ),
                  20.verticalSpace,
                  Center(
                    child: AnimatedSmoothIndicator(
                      activeIndex: controller.currentPage,
                      count: controller.weatherDetails.forecast.forecastday.length,
                      effect: WormEffect(
                        activeDotColor: theme.primaryColor,
                        dotColor: theme.colorScheme.secondary,
                        dotWidth: 10.w,
                        dotHeight: 10.h,
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  Container(
                    padding: EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      color: theme.canvasColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Strings.weatherNow.tr, style: theme.textTheme.displayMedium),
                        16.verticalSpace,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              WeatherDetailsItem(
                                title: Strings.wind.tr,
                                icon: Constants.wind,
                                value: '${controller.weatherDetails.current.windMph?.toInt() ?? 0}',
                                text: 'mph',
                              ),
                              16.horizontalSpace,
                              WeatherDetailsItem(
                                title: Strings.pressure.tr,
                                icon: Constants.pressure,
                                value: '${controller.weatherDetails.current.pressure.toInt() ?? 0}',
                                text: 'inHg',
                              ),
                            ],
                          ),
                        ),
                        20.verticalSpace,
                        Text(Strings.hoursForecast.tr, style: theme.textTheme.displayMedium),
                        16.verticalSpace,
                        SizedBox(
                          height: 100.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.forecastday.hour.length,
                            itemBuilder: (context, index) {
                              final hour = controller.forecastday.hour[index];
                              return ForecastHourItem(hour: hour);
                            },
                          ),
                        ),
                        16.verticalSpace,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SunRiseSetItem(
                                    text: Strings.sunrise.tr,
                                    value: controller.forecastday.astro.sunrise.formatTime(),
                                  ),
                                  SunRiseSetItem(
                                    text: Strings.sunset.tr,
                                    value: controller.forecastday.astro.sunset.formatTime(),
                                  ),
                                ],
                              ),
                            ),
                            10.horizontalSpace,
                            Expanded(
                              flex: 6,
                              child: Column(
                                children: [
                                  WeatherRowData(
                                    text: Strings.humidity.tr,
                                    value: '${controller.forecastday.day.avghumidity?.toInt() ?? 0}%',
                                  ),
                                  WeatherRowData(
                                    text: Strings.realFeel.tr,
                                    value: '${controller.forecastday.day.avgtempC?.toInt() ?? 0}°',
                                  ),
                                  WeatherRowData(
                                    text: Strings.uv.tr,
                                    value: '${controller.forecastday.day.uv?.toInt() ?? 0}',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
