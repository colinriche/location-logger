import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_a_igrid_model.dart';
export 'test_a_igrid_model.dart';

class TestAIgridWidget extends StatefulWidget {
  const TestAIgridWidget({Key? key}) : super(key: key);

  @override
  _TestAIgridWidgetState createState() => _TestAIgridWidgetState();
}

class _TestAIgridWidgetState extends State<TestAIgridWidget> {
  late TestAIgridModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestAIgridModel());
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
      backgroundColor: Colors.black,
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
          'Geofence Tester',
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 115.0,
                      height: 115.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF333333),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Shop',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: Color(0x7795A1AC),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 115.0,
                      height: 115.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF333333),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Garage',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: Color(0x7795A1AC),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 115.0,
                      height: 115.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF333333),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Market',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: Color(0x7795A1AC),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 115.0,
                      height: 115.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF333333),
                        borderRadius: BorderRadius.circular(25.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Park 1',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: Color(0x7795A1AC),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 115.0,
                      height: 115.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF333333),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Park 2',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: Color(0x7795A1AC),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 115.0,
                      height: 115.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF333333),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Park 3',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: Color(0x7795A1AC),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 115.0,
                      height: 115.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF333333),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Park 4',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: Color(0x7795A1AC),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 115.0,
                      height: 115.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF333333),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Park 5',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: Color(0x7795A1AC),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 115.0,
                      height: 115.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF333333),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Park 6',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: Color(0x7795A1AC),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Information from Location',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                        ),
                  ),
                ),
                Text(
                  'ID: x',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                      ),
                ),
                Text(
                  'State: y',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
