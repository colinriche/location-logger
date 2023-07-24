import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gym_model.dart';
export 'gym_model.dart';

class GymWidget extends StatefulWidget {
  const GymWidget({Key? key}) : super(key: key);

  @override
  _GymWidgetState createState() => _GymWidgetState();
}

class _GymWidgetState extends State<GymWidget> {
  late GymModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GymModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<MembershipsRow>>(
      future: MembershipsTable().querySingleRow(
        queryFn: (q) => q.eq(
          'type',
          'Gym',
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<MembershipsRow> gymMembershipsRowList = snapshot.data!;
        final gymMembershipsRow = gymMembershipsRowList.isNotEmpty
            ? gymMembershipsRowList.first
            : null;
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
              'Gym',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                child: Text(
                  gymMembershipsRow!.retailer!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 16.0,
                      ),
                ),
              ),
              Flexible(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      height: MediaQuery.sizeOf(context).height * 0.06,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.rectangle,
                      ),
                      child: BarcodeWidget(
                        data: '6402657',
                        barcode: Barcode.code39(),
                        width: 100.0,
                        height: 50.0,
                        color: FlutterFlowTheme.of(context).primaryText,
                        backgroundColor: Colors.transparent,
                        errorBuilder: (_context, _error) => SizedBox(
                          width: 100.0,
                          height: 50.0,
                        ),
                        drawText: false,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
