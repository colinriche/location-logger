import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'record_parking_copy_model.dart';
export 'record_parking_copy_model.dart';

class RecordParkingCopyWidget extends StatefulWidget {
  const RecordParkingCopyWidget({Key? key}) : super(key: key);

  @override
  _RecordParkingCopyWidgetState createState() =>
      _RecordParkingCopyWidgetState();
}

class _RecordParkingCopyWidgetState extends State<RecordParkingCopyWidget> {
  late RecordParkingCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecordParkingCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().withGPS = true;
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.safePop();
          },
        ),
        title: Text(
          FFAppState().withGPS.toString(),
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        actions: [
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('Menu');
              },
              child: Container(
                width: 70.0,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    'Menu',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 22.0,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Text(
              'Record Parking Event',
              style: FlutterFlowTheme.of(context).headlineMedium,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Text(
              'For added protection from unfair fines get in the habit of recording events',
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 16.0,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 32.0, 15.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController1 ??=
                          FormFieldController<String>(null),
                      options: [
                        'I Paid',
                        'I attempted to pay',
                        'I registered',
                        'Paid and Later Declined',
                        'Delivery/Collection',
                        'Pick Up/ Drop Off'
                      ],
                      onChanged: (val) =>
                          setState(() => _model.dropDownValue1 = val),
                      width: 335.0,
                      height: 50.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 16.0,
                              ),
                      hintText: 'Select Action...',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isSearchable: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 32.0, 15.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController2 ??=
                          FormFieldController<String>(null),
                      options: [
                        'By Coins',
                        'By Card',
                        'By Phone',
                        'By Text',
                        'By App',
                        'By Voucher',
                        'Contactless Card',
                        'Contactless Phone',
                        'By Tablet',
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        'Had to wait for client'
                      ],
                      onChanged: (val) =>
                          setState(() => _model.dropDownValue2 = val),
                      width: 335.0,
                      height: 50.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 16.0,
                              ),
                      hintText: 'Select Option...',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isSearchable: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 35.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                  child: Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      unselectedWidgetColor:
                          FlutterFlowTheme.of(context).secondaryText,
                    ),
                    child: Checkbox(
                      value: _model.checkboxValue ??= true,
                      onChanged: (newValue) async {
                        setState(() => _model.checkboxValue = newValue!);
                        if (newValue!) {
                          setState(() {
                            FFAppState().withGPS = true;
                          });
                        } else {
                          setState(() {
                            FFAppState().withGPS = false;
                          });
                        }
                      },
                      activeColor: FlutterFlowTheme.of(context).primary,
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Include my current location',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: !((_model.dropDownValue1 != null &&
                                    _model.dropDownValue1 != '') &&
                                (_model.dropDownValue2 != null &&
                                    _model.dropDownValue2 != ''))
                            ? null
                            : () async {
                                currentUserLocationValue =
                                    await getCurrentUserLocation(
                                        defaultLocation: LatLng(0.0, 0.0));
                                if (FFAppState().withGPS == true) {
                                  _model.messageWithGPS =
                                      await VisitsTable().insert({
                                    'created_at': supaSerialize<DateTime>(
                                        dateTimeFromSecondsSinceEpoch(
                                            getCurrentTimestamp
                                                .secondsSinceEpoch)),
                                    'gps': functions.latlangToString(
                                        currentUserLocationValue!),
                                    'type': _model.dropDownValue1,
                                    'info': _model.dropDownValue2,
                                    'withGPS': true,
                                  });
                                } else {
                                  _model.messageWithoutGPS =
                                      await VisitsTable().insert({
                                    'created_at': supaSerialize<DateTime>(
                                        dateTimeFromSecondsSinceEpoch(
                                            getCurrentTimestamp
                                                .secondsSinceEpoch)),
                                    'type': _model.dropDownValue1,
                                    'info': _model.dropDownValue2,
                                    'gps': null,
                                    'withGPS': false,
                                  });

                                  context.pushNamed(
                                    'messageSent',
                                    queryParameters: {
                                      'currentTime': serializeParam(
                                        dateTimeFromSecondsSinceEpoch(
                                            getCurrentTimestamp
                                                .secondsSinceEpoch),
                                        ParamType.DateTime,
                                      ),
                                      'myLocation': serializeParam(
                                        null,
                                        ParamType.LatLng,
                                      ),
                                    }.withoutNulls,
                                  );
                                }

                                context.pushNamed(
                                  'messageSent',
                                  queryParameters: {
                                    'myLocation': serializeParam(
                                      currentUserLocationValue,
                                      ParamType.LatLng,
                                    ),
                                    'currentTime': serializeParam(
                                      dateTimeFromSecondsSinceEpoch(
                                          getCurrentTimestamp
                                              .secondsSinceEpoch),
                                      ParamType.DateTime,
                                    ),
                                  }.withoutNulls,
                                );

                                setState(() {});
                              },
                        text: 'Save',
                        options: FFButtonOptions(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              50.0, 5.0, 50.0, 5.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          disabledColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          disabledTextColor: Color(0x5195A1AC),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Text(
                          'This will save a record of the parking event as you saw it.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
