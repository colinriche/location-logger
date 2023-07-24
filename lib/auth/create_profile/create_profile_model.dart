import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for firstName widget.
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for mobilePhone widget.
  TextEditingController? mobilePhoneController;
  String? Function(BuildContext, String?)? mobilePhoneControllerValidator;
  // State field(s) for licencePlate widget.
  TextEditingController? licencePlateController;
  String? Function(BuildContext, String?)? licencePlateControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    firstNameController?.dispose();
    mobilePhoneController?.dispose();
    licencePlateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
