import 'package:faiztask/ui/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:faiztask/ui/common/app_colors.dart';
import 'package:faiztask/ui/common/ui_helpers.dart';
import 'package:faiztask/ui/common/app_strings.dart';

class EuroConnectCard extends StatelessWidget {
  final String title;
  final String dataSize;
  final String validDays;
  final String price;
  final String supportedCountries;

  const EuroConnectCard({
    Key? key,
    required this.title,
    required this.dataSize,
    required this.validDays,
    required this.price,
    required this.supportedCountries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded( // takes equal space in row
      child: Container(
        height: 164, // figma height
        decoration: BoxDecoration(
          border: Border.all(color: lightBlueBg, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Title Badge ─────────────────────────────
            Padding(
              padding:  EdgeInsets.only(left: 8, top: 8),
              child: Container(
                height: 28, // figma badge height
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: lightBlueBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                
                child: CusText(
                  title,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
            ),

            verticalSpace10,

            // ─── Data & Valid For Labels ──────────────────
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
               
                  CusText(  
                    "Data:",
                    fontSize: 12,
                    height: 1.5,
                  ),
                 CusText(  
                    "Valid for:",
                    fontSize: 12,
                    height: 1.5,
                  ),
                ],
              ),
            ),

            verticalSpace2,

            // ─── Data & Valid For Values ──────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  CusText(
                    dataSize,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                  ),
                    CusText(
                      validDays,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                ],
              ),
            ),

            verticalSpace10,

            // ─── Divider 1 ────────────────────────────────
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Divider(color: dividerGrey, height: 1, thickness: 1),
            ),

            verticalSpace4,

            // ─── Supported Countries Row ──────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: supportedCountries, // bold number
                            style: const TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                              color: navy,
                            ),
                          ),
                           // small space between number and text
                          const TextSpan(
                            text: " Supported Countries", // normal text
                            style:  TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              color: navy,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: iconGrey,
                    size: 20,
                  ),
                ],
              ),
            ),

            verticalSpace4,

            // ─── Divider 2 ────────────────────────────────
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Divider(color: dividerGrey, height: 1, thickness: 1),
            ),

            verticalSpace8,

            // ─── Price Row ────────────────────────────────
            Padding(
              padding: const EdgeInsets.only(left: 8,),
              child: Row(
                children: [
             
                  const CusText(
                    usd,
                    fontSize: 16,
                    height: 1.5,
                    color: primaryBlue,
                  ),
                  horizontalSpace4,
                   CusText(
                    price,
                    fontSize: 16,
                    height: 1.5,
                    color: primaryBlue,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}