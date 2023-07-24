import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/lat_lng.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:provider/provider.dart';
import 'log_parking_model.dart';
export 'log_parking_model.dart';

class LogParkingWidget extends StatefulWidget {
  const LogParkingWidget({Key? key}) : super(key: key);

  @override
  _LogParkingWidgetState createState() => _LogParkingWidgetState();
}

class _LogParkingWidgetState extends State<LogParkingWidget> {
  late LogParkingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogParkingModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

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
            context.pop();
          },
        ),
        title: Text(
          'Log Parking',
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
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Text(
                'Log My Parking',
                style: FlutterFlowTheme.of(context).headlineMedium,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 15.0),
            child: Text(
              'Modern day parking is full of technology that is set to trip you up, issuing as many parking tickets as they can whether it is your fault or the fault with the parking system. They are in the business of making money from parking tickets, if a fault makes them more money they will not be in a rush to fix it.\n\nWe suggest you get in the habit of recording every parking event to provide evidence shoud yo receive an unfair parking ticket. We make to process simple.',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 16.0,
                  ),
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: FlutterFlowStaticMap(
                location: currentUserLocationValue!,
                apiKey:
                    'pk.eyJ1IjoiY29saW5yaWNoZSIsImEiOiJjbGoyajlvdzUxbjM0M21xZnBhYThsZnMxIn0.6B8Hc_8conVMHqKeeaVa-g',
                style: MapBoxStyle.Satellite_Street_V11,
                width: 250.0,
                height: 250.0,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(0.0),
                markerColor: FlutterFlowTheme.of(context).primary,
                zoom: 17,
                tilt: 0,
                rotation: 0,
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
                    Wrap(
                      spacing: 0.0,
                      runSpacing: 0.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.vertical,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        FlutterFlowRadioButton(
                          options: [
                            'Paid with coins',
                            'Paid with card',
                            'Paid by phone',
                            'Paid by text',
                            'Paid by App'
                          ].toList(),
                          onChanged: (val) => setState(() {}),
                          controller: _model.radioButtonValueController ??=
                              FormFieldController<String>(null),
                          optionHeight: 32.0,
                          textStyle: FlutterFlowTheme.of(context).labelMedium,
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium,
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 30.0, 30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'ADD SOME INFO',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('RecordParking');
                          },
                          text: 'Continue',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
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
