import 'package:faiztask/ui/bottom_sheets/cart/cart_sheet_model.dart';
import 'package:faiztask/ui/widgets/euro_connected.dart';
import 'package:faiztask/ui/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:faiztask/ui/common/app_colors.dart';
import 'package:faiztask/ui/common/ui_helpers.dart';
import 'package:faiztask/ui/common/app_strings.dart';
import 'package:faiztask/ui/views/home/home_viewmodel.dart';
import 'package:faiztask/ui/widgets/common/bundle_card/bundle_card.dart';
import 'package:stacked/stacked.dart';
import 'package:faiztask/app/app.locator.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Top Header ───────────────────────────────────────────
            _TopContainer(),

            // ─── Search Bar ───────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.only(
                right: 23,
                left: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace4,
                  _SearchBar(context: context),
                  verticalSpace8,
                ],
              ),
            ),

            // ─── Country Tag ──────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 2),
              child: _CountryTag(),
            ),

            // ─── Filter Buttons ───────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 17),
              child: _FilterButtons(),
            ),

            // ─── Bundles Title ────────────────────────────────────────
            const Padding(
              padding: EdgeInsets.only(left: 23, top: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                // child: Text(
                //   bundlesAvailable,
                //   style: TextStyle(
                //     fontFamily: 'SFProDisplay',
                //     fontSize: 14,
                //     fontWeight: FontWeight.w700,
                //     height: 1.5,
                //     color: darkNavy,
                //   ),
                // ),
                child: CusText(
                  bundlesAvailable,
                  fontWeight: FontWeight.w700,
                  color: darkNavy,
                ),
              ),
            ),

            // ─── Bundle Cards Row 1 ───────────────────────────────────
            _BundleRow(
              cards: [
                BundleCard(
                  dataSize: "3 GB",
                  validDays: "30 Days",
                  price: "2.99",
                  isSelected: viewModel.isSelected("3 GB", "30 Days"),
                  onTap: () => viewModel.onBundleCardTap(
                    CartItem(
                        dataSize: "3 GB", validDays: "30 Days", price: "2.99"),
                  ),
                ),
                BundleCard(
                  dataSize: "5 GB",
                  validDays: "7 Days",
                  price: "3.50",
                  isSelected: viewModel.isSelected("5 GB", "7 Days"),
                  onTap: () => viewModel.onBundleCardTap(
                    CartItem(
                        dataSize: "5 GB", validDays: "7 Days", price: "3.50"),
                  ),
                ),
                BundleCard(
                  dataSize: "5 GB",
                  validDays: "15 Days",
                  price: "3.99",
                  isSelected: viewModel.isSelected("5 GB", "15 Days"),
                  onTap: () => viewModel.onBundleCardTap(
                    CartItem(
                        dataSize: "5 GB", validDays: "15 Days", price: "3.99"),
                  ),
                ),
              ],
            ),

            // ─── Bundle Cards Row 2 ───────────────────────────────────
            _BundleRow(
              cards: [
                BundleCard(
                  dataSize: "5 GB",
                  validDays: "30 Days",
                  price: "4.25",
                  isSelected: viewModel.isSelected("5 GB", "30 Days"),
                  onTap: () => viewModel.onBundleCardTap(
                    CartItem(
                        dataSize: "5 GB", validDays: "30 Days", price: "4.25"),
                  ),
                ),
                BundleCard(
                  dataSize: "10 GB",
                  validDays: "10 Days",
                  price: "5.50",
                  isSelected: viewModel.isSelected("10 GB", "10 Days"),
                  onTap: () => viewModel.onBundleCardTap(
                    CartItem(
                        dataSize: "10 GB", validDays: "10 Days", price: "5.50"),
                  ),
                ),
                BundleCard(
                  dataSize: "10 GB",
                  validDays: "15 Days",
                  price: "5.75",
                  isSelected: viewModel.isSelected("10 GB", "15 Days"),
                  onTap: () => viewModel.onBundleCardTap(
                    CartItem(
                        dataSize: "10 GB", validDays: "15 Days", price: "5.75"),
                  ),
                ),
              ],
            ),

            // ─── Bundle Cards Row 3 ───────────────────────────────────
            _BundleRow(
              cards: [
                BundleCard(
                  dataSize: "20 GB",
                  validDays: "30 Days",
                  price: "7.48",
                  isSelected: viewModel.isSelected("20 GB", "30 Days"),
                  onTap: () => viewModel.onBundleCardTap(
                    CartItem(
                        dataSize: "20 GB", validDays: "30 Days", price: "7.48"),
                  ),
                ),
                BundleCard(
                  dataSize: "Unlimited",
                  validDays: "10 Days",
                  price: "5.50",
                  isSelected: viewModel.isSelected("Unlimited", "10 Days"),
                  onTap: () => viewModel.onBundleCardTap(
                    CartItem(
                        dataSize: "Unlimited",
                        validDays: "10 Days",
                        price: "5.50"),
                  ),
                ),
              ],
            ),

            // ─── Regional Plans Title ─────────────────────────────────
            const Padding(
              padding: EdgeInsets.only(left: 24, top: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                // child: Text(
                //   regionalPlans,
                //   style:  TextStyle(
                //     fontFamily: 'SFProDisplay',
                //     fontSize: 14,
                //     fontWeight: FontWeight.w700,
                //     height: 1.5,
                //     color: darkNavy,
                //   ),
                // ),
                child: CusText(
                  regionalPlans,
                  fontWeight: FontWeight.w700,
                  color: darkNavy,
                  height: 1.5,
                ),
              ),
            ),

            // ─── EuroConnect Cards Row 1 ──────────────────────────────
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 8, right: 16),
              child: Row(
                children: [
                  EuroConnectCard(
                    title: "EuroConnect",
                    dataSize: "1 GB",
                    validDays: "7 Days",
                    price: "2.51",
                    supportedCountries: "32",
                  ),
                  horizontalSpace8,
                  EuroConnectCard(
                    title: "Global Unlimited",
                    dataSize: "Unlimited",
                    validDays: "1 Day",
                    price: "2.99",
                    supportedCountries: "34",
                  ),
                ],
              ),
            ),

            // ─── EuroConnect Cards Row 2 ──────────────────────────────
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 8, right: 16),
              child: Row(
                children: [
                  EuroConnectCard(
                    title: "EuroLink",
                    dataSize: "1 GB",
                    validDays: "7 Days",
                    price: "2.52",
                    supportedCountries: "34",
                  ),
                  horizontalSpace8,
                  EuroConnectCard(
                    title: "worldisyours",
                    dataSize: "1 GB",
                    validDays: "1 Day",
                    price: "3.00",
                    supportedCountries: "57",
                  ),
                ],
              ),
            ),

            // ─── Support Section ──────────────────────────────────────
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 24, bottom: 42),
              child: _SupportSection(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) =>
      locator<HomeViewModel>();
}

// ─── Top Container Widget ─────────────────────────────────────────────────────
class _TopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background color: full width, height 120px
        Container(
          height: 120, // header height
          color: primaryBlue,
        ),

        // Circular gradient overlay
        Positioned(
          top: -95.93,
          left: 84,
          child: Container(
            width: 222, // circle width from figma
            height: 203.7, // circle height from figma
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [whatsapp, primaryBlue],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),

        // Header content inside SafeArea
        const SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 20, // top padding inside safearea
              left: 23, // left padding from figma
              right: 24, // right padding from figma
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios, color: white, size: 20),
                CusText(
                  countryName,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: white,
                ),
                Icon(Icons.shopping_bag_outlined, color: white, size: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Search Bar Widget ────────────────────────────────────────────────────────
class _SearchBar extends StatelessWidget {
  final BuildContext context;
  const _SearchBar({required this.context});

  @override
  Widget build(BuildContext _) {
    return Container(
      width: searchBarWidth(context), 
      height: 50, 
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: borderGrey, width: 1),
        borderRadius: BorderRadius.circular(50), 
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(Icons.search, color: borderGrey, size: 22),
            horizontalSpace8,
            CusText(
              searchHint,
              height: 1.5,
              color: borderGrey,
            )
          ],
        ),
      ),
    );
  }
}

// ─── Country Tag Widget ───────────────────────────────────────────────────────
class _CountryTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 117, // figma width
      height: 40, // figma height
      decoration: BoxDecoration(
        color: lightBlueBg,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(turkeyFlag, width: 24, height: 18),
          const CusText(
            countryName,
            color: black,
          ),
          const Icon(Icons.close, color: borderGrey, size: 16),
        ],
      ),
    );
  }
}

// ─── Filter Buttons Widget ────────────────────────────────────────────────────
class _FilterButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        // All - filled button
        _FilterButton(label: all, isFilled: true, width: 51),
        horizontalSpace8,
        // Standard - outlined button
        _FilterButton(label: standard, isFilled: false, width: 93),
        horizontalSpace8,
        // Unlimited - outlined button
        _FilterButton(label: unlimited, isFilled: false, width: 96),
      ],
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String label;
  final bool isFilled;
  final double width;

  const _FilterButton({
    required this.label,
    required this.isFilled,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 32, // figma height
      decoration: BoxDecoration(
        color: isFilled ? primaryBlue : Colors.transparent,
        border: isFilled ? null : Border.all(color: primaryBlue, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: CusText(
          label,
          fontWeight: isFilled ? FontWeight.w700 : FontWeight.w400,
          color: isFilled ? white : lightBlue,
          height: 1.5,
        ),
      ),
    );
  }
}

// ─── Bundle Row Widget ────────────────────────────────────────────────────────
class _BundleRow extends StatelessWidget {
  final List<Widget> cards;
  const _BundleRow({required this.cards});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: cards,
      ),
    );
  }
}

// ─── Support Section Widget ───────────────────────────────────────────────────
class _SupportSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          needSupport,
          style: TextStyle(
            fontFamily: 'SFProDisplay',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 1.5,
            color: darkNavy,
          ),
        ),
        Row(
          children: [
            const CusText(
              contactUs,
              height: 1.5,
            ),
            Image.asset(whatsappLogo, width: 24, height: 24),
            horizontalSpace4,
            const CusText(
              whatsappS,
              fontWeight: FontWeight.w700,
              color: whatsapp,
            )
          ],
        ),
      ],
    );
  }
}
