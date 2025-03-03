import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'userprofile_page_widget.dart' show UserprofilePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserprofilePageModel extends FlutterFlowModel<UserprofilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for EditUserName widget.
  FocusNode? editUserNameFocusNode;
  TextEditingController? editUserNameTextController;
  String? Function(BuildContext, String?)? editUserNameTextControllerValidator;
  // State field(s) for EditEmail widget.
  FocusNode? editEmailFocusNode;
  TextEditingController? editEmailTextController;
  String? Function(BuildContext, String?)? editEmailTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    editUserNameFocusNode?.dispose();
    editUserNameTextController?.dispose();

    editEmailFocusNode?.dispose();
    editEmailTextController?.dispose();
  }
}
