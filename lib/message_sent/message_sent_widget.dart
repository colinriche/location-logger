import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'message_sent_model.dart';
export 'message_sent_model.dart';

class MessageSentWidget extends StatefulWidget {
  const MessageSentWidget({
    Key? key,
    this.myLocation,
    required this.currentTime,
  }) : super(key: key);

  final LatLng? myLocation;
  final DateTime? currentTime;

  @override
  _MessageSentWidgetState createState() => _MessageSentWidgetState();
}

class _MessageSentWidgetState extends State<MessageSentWidget> {
  late MessageSentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageSentModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: GeoCodingCall.call(
        latlang: functions.latlangToString(widget.myLocation!),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
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
        final messageSentGeoCodingResponse = snapshot.data!;
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Message Sent',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 32.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 300.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Wrap(
                            spacing: 5.0,
                            runSpacing: 5.0,
                            alignment: WrapAlignment.spaceEvenly,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            direction: Axis.vertical,
                            runAlignment: WrapAlignment.center,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  dateTimeFormat('jm', widget.currentTime),
                                  '1/1/70',
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  dateTimeFormat('yMMMd', widget.currentTime),
                                  '???',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Wrap(
                                  spacing: 0.0,
                                  runSpacing: 0.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.vertical,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Text(
                                      getJsonField(
                                        messageSentGeoCodingResponse.jsonBody,
                                        r'''$.results[0].formatted_address''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                getJsonField(
                                  messageSentGeoCodingResponse.jsonBody,
                                  r'''$.results[0].address_components[4].long_name''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Text(
                                getJsonField(
                                  messageSentGeoCodingResponse.jsonBody,
                                  r'''$.results[0].address_components[5].long_name''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Text(
                                getJsonField(
                                  messageSentGeoCodingResponse.jsonBody,
                                  r'''$.results[0].address_components[6].long_name''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
