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
import 'add_goal_page_widget.dart' show AddGoalPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddGoalPageModel extends FlutterFlowModel<AddGoalPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for AddGoalTitle widget.
  FocusNode? addGoalTitleFocusNode;
  TextEditingController? addGoalTitleTextController;
  String? Function(BuildContext, String?)? addGoalTitleTextControllerValidator;
  String? _addGoalTitleTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Goal Title is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for AddGoalReason widget.
  FocusNode? addGoalReasonFocusNode;
  TextEditingController? addGoalReasonTextController;
  String? Function(BuildContext, String?)? addGoalReasonTextControllerValidator;
  String? _addGoalReasonTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'What will I accomplish is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 60) {
      return 'Maximum 60 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Model for Tags component.
  late TagsModel tagsModel;
  DateTime? datePicked1;
  // State field(s) for Frequency widget.
  List<String>? frequencyValue;
  FormFieldController<List<String>>? frequencyValueController;
  DateTime? datePicked2;
  DateTime? datePicked3;

  @override
  void initState(BuildContext context) {
    addGoalTitleTextControllerValidator = _addGoalTitleTextControllerValidator;
    addGoalReasonTextControllerValidator =
        _addGoalReasonTextControllerValidator;
    tagsModel = createModel(context, () => TagsModel());
  }

  @override
  void dispose() {
    addGoalTitleFocusNode?.dispose();
    addGoalTitleTextController?.dispose();

    addGoalReasonFocusNode?.dispose();
    addGoalReasonTextController?.dispose();

    tagsModel.dispose();
  }
}
