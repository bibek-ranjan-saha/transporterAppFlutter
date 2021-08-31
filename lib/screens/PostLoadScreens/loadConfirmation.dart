import 'package:flutter/material.dart';
import 'package:liveasy/constants/color.dart';
import 'package:liveasy/constants/fontSize.dart';
import 'package:liveasy/constants/fontWeights.dart';
import 'package:liveasy/constants/spaces.dart';
import 'package:liveasy/widgets/LoadConfirmationTemplate.dart';
import 'package:liveasy/widgets/buttons/backButtonWidget.dart';
import 'package:liveasy/widgets/buttons/loadConfirmationScreenButton.dart';
import 'package:liveasy/widgets/headingTextWidget.dart';
import 'package:liveasy/widgets/loadLabelValueRowTemplate.dart';
import 'package:liveasy/providerClass/providerData.dart';
import 'package:liveasy/widgets/loadingWidget.dart';
import 'package:provider/provider.dart';
import 'package:marquee/marquee.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoadConfirmation extends StatefulWidget {
  const LoadConfirmation({Key? key}) : super(key: key);

  @override
  _LoadConfirmationState createState() => _LoadConfirmationState();
}

class _LoadConfirmationState extends State<LoadConfirmation> {
  @override
  Widget build(BuildContext context) {
    ProviderData providerData = Provider.of<ProviderData>(context);
    providerData.updateUnitValue();
    // providerData.updateLoadWidget(true);
    return Scaffold(
      backgroundColor: statusBarColor,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(space_2),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: space_4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: space_2),
                              child: BackButtonWidget(),
                            ),
                            SizedBox(
                              width: space_3,
                            ),
                            HeadingTextWidget(AppLocalizations.of(context)!.loadConfirmation),
                            // HelpButtonWidget(),
                          ],
                        ),
                        SizedBox(
                          height: space_4,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: space_3),
                          child: Text(
                            AppLocalizations.of(context)!.reviewDetailsForYourLoad,
                            style: TextStyle(
                                fontSize: size_9,
                                fontWeight: mediumBoldWeight,
                                color: liveasyBlackColor),
                          ),
                        ),
                        SizedBox(
                          height: space_4,
                        ),
                        Card(
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                space_3, space_2, space_3, space_3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: LoadConfirmationTemplate(
                                      value:
                                          "${providerData.loadingPointCityPostLoad}, ${providerData.loadingPointStatePostLoad} ==> ${providerData.unloadingPointCityPostLoad}, ${providerData.unloadingPointStatePostLoad}",
                                      label: AppLocalizations.of(context)!.location),
                                ),
                                LoadConfirmationTemplate(
                                    value: providerData.bookingDate,
                                    label: AppLocalizations.of(context)!.date),
                                LoadConfirmationTemplate(
                                    value: providerData.truckTypeValue,
                                    label: AppLocalizations.of(context)!.truckType),
                                LoadConfirmationTemplate(
                                    value: providerData.truckNumber.toString(),
                                    label: AppLocalizations.of(context)!.numberOfTrucks),
                                LoadConfirmationTemplate(
                                    value: providerData.passingWeightValue
                                        .toString(),
                                    label: AppLocalizations.of(context)!.weight),
                                LoadConfirmationTemplate(
                                    value: providerData.productType,
                                    label: 'Product Type'),
                                LoadConfirmationTemplate(
                                    value: providerData.price == 0
                                        ?  AppLocalizations.of(context)!.priceNotGiven
                                        : "Rs.${providerData.price}/${providerData.unitValue}",
                                    label: AppLocalizations.of(context)!.price),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: space_6),
                    child: Padding(
                      padding: EdgeInsets.only(left: space_8, right: space_8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child:
                                  LoadConfirmationScreenButton( // edit button
                                      title: AppLocalizations.of(context)!.edit)),
                          SizedBox(
                            width: space_10,
                          ),
                          Expanded(
                              child: LoadConfirmationScreenButton( // confirm button
                                  title: AppLocalizations.of(context)!.confirm)),
                        ],
                      ),
                    ),
                  )

                  // HelpButtonWidget(),
                ],
              ),
            )),
      ),
    );
  }
}
