import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'msg_history_model.dart';
export 'msg_history_model.dart';

class MsgHistoryWidget extends StatefulWidget {
  const MsgHistoryWidget({Key? key}) : super(key: key);

  @override
  _MsgHistoryWidgetState createState() => _MsgHistoryWidgetState();
}

class _MsgHistoryWidgetState extends State<MsgHistoryWidget> {
  late MsgHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MsgHistoryModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<MessagesRow>>(
      future: MessagesTable().queryRows(
        queryFn: (q) => q.order('created_at'),
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
        List<MessagesRow> msgHistoryMessagesRowList = snapshot.data!;
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
            title: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('messageOperator');
              },
              child: Text(
                'Message History',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
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
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                  child: Text(
                    'Most Recent',
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                ),
                Builder(
                  builder: (context) {
                    final myMessages = msgHistoryMessagesRowList.toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: myMessages.length,
                      itemBuilder: (context, myMessagesIndex) {
                        final myMessagesItem = myMessages[myMessagesIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 1.0),
                          child: Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  color: FlutterFlowTheme.of(context).primary,
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 5.0, 0.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      myMessagesItem.id.toString(),
                                      'null',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 10.0,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      myMessagesItem.withGPS?.toString(),
                                      'null',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 10.0,
                                        ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          myMessagesItem.recipient,
                                          'null',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat('relative',
                                                myMessagesItem.createdAt),
                                            'null',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: AutoSizeText(
                                        valueOrDefault<String>(
                                          myMessagesItem.message,
                                          'null',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 18.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  if (valueOrDefault<bool>(
                                    myMessagesItem.msgOut == true,
                                    true,
                                  ))
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  if (valueOrDefault<bool>(
                                    myMessagesItem.msgOut != true,
                                    false,
                                  ))
                                    Icon(
                                      Icons.arrow_back_ios,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
