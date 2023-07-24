import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'maps_model.dart';
export 'maps_model.dart';

class MapsWidget extends StatefulWidget {
  const MapsWidget({Key? key}) : super(key: key);

  @override
  _MapsWidgetState createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  late MapsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapsModel());

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
      resizeToAvoidBottomInset: false,
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
          'Map',
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
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
              child: Container(
                width: 350.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Stack(
                  children: [
                    FlutterFlowPlacePicker(
                      iOSGoogleMapsApiKey:
                          'AIzaSyDFQ1-X2h6bqHeE9WOt1o7ll3pZGKHcuzo',
                      androidGoogleMapsApiKey:
                          'AIzaSyDgjahjmxXbNuS2vE3oSw01dpoIZ2ivvzE',
                      webGoogleMapsApiKey:
                          'AIzaSyCyGcsnPrn-SPlyL16vAt1V3sgGAZxvZuE',
                      onSelect: (place) async {
                        setState(() => _model.placePickerValue = place);
                      },
                      defaultText: 'Select Location',
                      icon: Icon(
                        Icons.place,
                        color: FlutterFlowTheme.of(context).info,
                        size: 16.0,
                      ),
                      buttonOptions: FFButtonOptions(
                        width: 200.0,
                        height: 40.0,
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Builder(builder: (context) {
                      final _googleMapMarker = currentUserLocationValue;
                      return FlutterFlowGoogleMap(
                        controller: _model.googleMapsController,
                        onCameraIdle: (latLng) =>
                            setState(() => _model.googleMapsCenter = latLng),
                        initialLocation: _model.googleMapsCenter ??=
                            LatLng(52.03967, -0.76108),
                        markers: [
                          if (_googleMapMarker != null)
                            FlutterFlowMarker(
                              _googleMapMarker.serialize(),
                              _googleMapMarker,
                              () async {
                                await _model.googleMapsController.future.then(
                                  (c) => c.animateCamera(
                                    CameraUpdate.newLatLng(_model
                                        .googleMapsCenter!
                                        .toGoogleMaps()),
                                  ),
                                );
                              },
                            ),
                        ],
                        markerColor: GoogleMarkerColor.violet,
                        mapType: MapType.normal,
                        style: GoogleMapStyle.standard,
                        initialZoom: 14.0,
                        allowInteraction: true,
                        allowZoom: true,
                        showZoomControls: true,
                        showLocation: true,
                        showCompass: true,
                        showMapToolbar: true,
                        showTraffic: true,
                        centerMapOnMarkerTap: true,
                      );
                    }),
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
