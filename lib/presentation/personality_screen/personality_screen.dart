import 'package:eventify/widgets/app_bar/custom_app_bar.dart';
import 'package:eventify/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:eventify/widgets/app_bar/appbar_title.dart';
import 'package:eventify/widgets/custom_text_form_field.dart';
import 'package:eventify/widgets/custom_elevated_button.dart';
import 'models/personality_model.dart';
import 'package:flutter/material.dart';
import 'package:eventify/core/app_export.dart';
import 'bloc/personality_bloc.dart';

class PersonalityScreen extends StatelessWidget {
  const PersonalityScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<PersonalityBloc>(
        create: (context) => PersonalityBloc(
            PersonalityState(personalityModelObj: PersonalityModel()))
          ..add(PersonalityInitialEvent()),
        child: PersonalityScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 19.v),
                    child: Container(
                        margin: EdgeInsets.only(bottom: 5.v),
                        padding: EdgeInsets.symmetric(horizontal: 32.h),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildEditProfilePic(context),
                              SizedBox(height: 50.v),
                              Text("lbl_username".tr,
                                  style: theme.textTheme.labelLarge),
                              SizedBox(height: 13.v),
                              _buildUserName(context),
                              SizedBox(height: 18.v),
                              Text("lbl_first_name2".tr,
                                  style: theme.textTheme.labelLarge),
                              SizedBox(height: 13.v),
                              _buildFirstName(context),
                              SizedBox(height: 18.v),
                              Text("lbl_last_name2".tr,
                                  style: theme.textTheme.labelLarge),
                              SizedBox(height: 13.v),
                              _buildLastName(context),
                              SizedBox(height: 20.v),
                              Text("lbl_hobby".tr,
                                  style: theme.textTheme.labelLarge),
                              SizedBox(height: 11.v),
                              _buildHobby(context),
                              SizedBox(height: 18.v),
                              Text("lbl_date_of_birth".tr,
                                  style: theme.textTheme.labelLarge),
                              SizedBox(height: 13.v),
                              _buildDateOfBirth(context),
                              SizedBox(height: 20.v),
                              Text("lbl_country".tr,
                                  style: theme.textTheme.labelLarge),
                              SizedBox(height: 11.v),
                              _buildCountry(context),
                              SizedBox(height: 34.v),
                              _buildChangeSave(context)
                            ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 56.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 32.h, top: 14.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        actions: [
          AppbarTitle(
              text: "lbl_personality".tr,
              margin: EdgeInsets.symmetric(horizontal: 32.h, vertical: 14.v))
        ]);
  }

  /// Section Widget
  Widget _buildEditProfilePic(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 86.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: ImageConstant.imgProfileImage,
              height: 139.adaptSize,
              width: 139.adaptSize,
              radius: BorderRadius.circular(69.h)),
          SizedBox(height: 18.v),
          Opacity(
              opacity: 0.8,
              child: Padding(
                  padding: EdgeInsets.only(left: 35.h),
                  child: Text("lbl_edit_photo".tr,
                      style: CustomTextStyles.labelLargeSecondaryContainer_1)))
        ]));
  }

  /// Section Widget
  Widget _buildUserName(BuildContext context) {
    return BlocSelector<PersonalityBloc, PersonalityState,
            TextEditingController?>(
        selector: (state) => state.userNameController,
        builder: (context, userNameController) {
          return CustomTextFormField(
              controller: userNameController,
              hintText: "lbl_adalahalcana".tr,
              hintStyle: CustomTextStyles.titleSmallOnPrimary_1);
        });
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return BlocSelector<PersonalityBloc, PersonalityState,
            TextEditingController?>(
        selector: (state) => state.firstNameController,
        builder: (context, firstNameController) {
          return CustomTextFormField(
              controller: firstNameController,
              hintText: "lbl_alcanasatre".tr,
              hintStyle: CustomTextStyles.titleSmallOnPrimary_1);
        });
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return BlocSelector<PersonalityBloc, PersonalityState,
            TextEditingController?>(
        selector: (state) => state.lastNameController,
        builder: (context, lastNameController) {
          return CustomTextFormField(
              controller: lastNameController,
              hintText: "lbl_fourta".tr,
              hintStyle: CustomTextStyles.titleSmallOnPrimary_1);
        });
  }

  /// Section Widget
  Widget _buildHobby(BuildContext context) {
    return BlocSelector<PersonalityBloc, PersonalityState,
            TextEditingController?>(
        selector: (state) => state.hobbyController,
        builder: (context, hobbyController) {
          return CustomTextFormField(
              controller: hobbyController,
              hintText: "lbl_sleep".tr,
              hintStyle: CustomTextStyles.titleSmallOnPrimary_1);
        });
  }

  /// Section Widget
  Widget _buildDateOfBirth(BuildContext context) {
    return BlocSelector<PersonalityBloc, PersonalityState,
            TextEditingController?>(
        selector: (state) => state.dateOfBirthController,
        builder: (context, dateOfBirthController) {
          return CustomTextFormField(
              controller: dateOfBirthController,
              hintText: "lbl_28_may_2002".tr,
              hintStyle: CustomTextStyles.titleSmallOnPrimary_1);
        });
  }

  /// Section Widget
  Widget _buildCountry(BuildContext context) {
    return BlocSelector<PersonalityBloc, PersonalityState,
            TextEditingController?>(
        selector: (state) => state.countryController,
        builder: (context, countryController) {
          return CustomTextFormField(
              controller: countryController,
              hintText: "lbl_indonesian".tr,
              hintStyle: CustomTextStyles.titleSmallOnPrimary_1,
              textInputAction: TextInputAction.done);
        });
  }

  /// Section Widget
  Widget _buildChangeSave(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_change_save".tr,
        buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
        onPressed: () {
          onTapChangeSave(context);
        });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapChangeSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }
}
