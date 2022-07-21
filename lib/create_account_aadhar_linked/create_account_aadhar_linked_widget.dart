import '../create_account_p_a_n2/create_account_p_a_n2_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountAadharLinkedWidget extends StatefulWidget {
  const CreateAccountAadharLinkedWidget({
    Key? key,
    this.aadharFullResponse,
  }) : super(key: key);

  final dynamic aadharFullResponse;

  @override
  _CreateAccountAadharLinkedWidgetState createState() =>
      _CreateAccountAadharLinkedWidgetState();
}

class _CreateAccountAadharLinkedWidgetState
    extends State<CreateAccountAadharLinkedWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        automaticallyImplyLeading: false,
        title: Text(
          'Create Account',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 22,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 8, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePageWidget(),
                  ),
                );
              },
              child: Icon(
                Icons.home,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: 640,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  valueOrDefault<String>(
                    getJsonField(
                      widget.aadharFullResponse!,
                      r'''$.result.dataFromAadhaar.name''',
                    ).toString(),
                    'Aadhar Name',
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    getJsonField(
                      widget.aadharFullResponse!,
                      r'''$.result.dataFromAadhaar.maskedAadhaarNumber''',
                    ).toString(),
                    'Aadhar Number',
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    getJsonField(
                      widget.aadharFullResponse!,
                      r'''$.result.dataFromAadhaar.dob''',
                    ).toString(),
                    'Aadhar DoB',
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: Text(
                    valueOrDefault<String>(
                      getJsonField(
                        widget.aadharFullResponse!,
                        r'''$.result.dataFromAadhaar.address.combinedAddress''',
                      ).toString(),
                      'Aadhar Address',
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                  ),
                ),
                Divider(
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                Text(
                  'Thank you for linking Aadhar.',
                  style: FlutterFlowTheme.of(context).subtitle1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                ),
                Divider(),
                FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAccountPAN2Widget(),
                      ),
                    );
                  },
                  text: 'Next',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
