import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/tags_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'edit_habit_page_widget.dart' show EditHabitPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditHabitPageModel extends FlutterFlowModel<EditHabitPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for HabitTitle widget.
  FocusNode? habitTitleFocusNode;
  TextEditingController? habitTitleTextController;
  String? Function(BuildContext, String?)? habitTitleTextControllerValidator;
  // State field(s) for HabitReason widget.
  FocusNode? habitReasonFocusNode;
  TextEditingController? habitReasonTextController;
  String? Function(BuildContext, String?)? habitReasonTextControllerValidator;
  // Model for Tags component.
  late TagsModel tagsModel;
  DateTime? datePicked1;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  DateTime? datePicked2;
  DateTime? datePicked3;

  @override
  void initState(BuildContext context) {
    tagsModel = createModel(context, () => TagsModel());
  }

  @override
  void dispose() {
    habitTitleFocusNode?.dispose();
    habitTitleTextController?.dispose();

    habitReasonFocusNode?.dispose();
    habitReasonTextController?.dispose();

    tagsModel.dispose();
  }
}
