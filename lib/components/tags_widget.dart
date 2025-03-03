import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tags_model.dart';
export 'tags_model.dart';

class TagsWidget extends StatefulWidget {
  const TagsWidget({
    super.key,
    Color? color,
    this.tags,
    this.tobe,
  }) : this.color = color ?? const Color(0xFF1C4494);

  final Color color;
  final List<String>? tags;
  final String? tobe;

  @override
  State<TagsWidget> createState() => _TagsWidgetState();
}

class _TagsWidgetState extends State<TagsWidget> {
  late TagsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        FlutterFlowDropDown<String>(
          multiSelectController: _model.tagsDropDownValueController ??=
              FormListFieldController<String>(
                  _model.tagsDropDownValue ??= List<String>.from(
            widget!.tags ?? [],
          )),
          options: List<String>.from([
            'Stronger',
            'More Technical',
            'More Flexible',
            'More Creative',
            'Smarter',
            'Accomplished'
          ]),
          optionLabels: [
            'Stronger',
            'More Technical',
            'More Flexible',
            'More Creative',
            'Smarter',
            'Accomplished'
          ],
          height: 40.0,
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
              ),
          hintText: 'Select Traits',
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          elevation: 2.0,
          borderColor: widget!.color,
          borderWidth: 0.0,
          borderRadius: 8.0,
          margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          hidesUnderline: true,
          isOverButton: false,
          isSearchable: false,
          isMultiSelect: true,
          onMultiSelectChanged: (val) =>
              safeSetState(() => _model.tagsDropDownValue = val),
        ),
      ].divide(SizedBox(height: 20.0)),
    );
  }
}
