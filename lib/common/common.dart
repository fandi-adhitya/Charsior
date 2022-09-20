import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:noerani_cashier/modules/cart/cart.dart';
import 'package:noerani_cashier/modules/product/product.dart';
import 'package:noerani_cashier/modules/taxonomies/taxonomies.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletons/skeletons.dart';

import '../modules/product/product.dart';

part 'constants/colors.dart';
part 'constants/fonts.dart';
part 'constants/urls.dart';

part 'routes/routes.dart';

part 'services/services.dart';

part 'preferences/preferences.dart';

/* Widget */
part 'widgets/card/product_card.dart';
part 'widgets/card/product_card_onLoad.dart';
part 'widgets/textfield/search_field.dart';
part 'widgets/other/choice_chip.dart';
part 'widgets/other/choice_chip2.dart';
part 'widgets/other/choice_chip_onLoad.dart';
part 'widgets/other/bottom_cart.dart';
part 'widgets/other/separator.dart';
part 'widgets/other/empty_data.dart';
part 'widgets/snackbar/snackbar.dart';
part 'widgets/dialog/dialog.dart';
