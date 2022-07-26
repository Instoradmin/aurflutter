import '../backend/api_requests/api_calls.dart';
import '../create_account/create_account_widget.dart';
import '../create_account_aadhar/create_account_aadhar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountDetailsWidget extends StatefulWidget {
  const CreateAccountDetailsWidget({Key? key}) : super(key: key);

  @override
  _CreateAccountDetailsWidgetState createState() =>
      _CreateAccountDetailsWidgetState();
}

class _CreateAccountDetailsWidgetState
    extends State<CreateAccountDetailsWidget> {
  ApiCallResponse? registerAPIResponse;
  ApiCallResponse? registrationAPIResponse;
  TextEditingController? passwordController;
  TextEditingController? usernameController;
  TextEditingController? firstnameController;
  TextEditingController? lastnameController;
  TextEditingController? mobilenumberController;
  TextEditingController? emailController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    firstnameController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    lastnameController = TextEditingController();
    mobilenumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 0),
          child: Image.asset(
            'assets/images/aurigraphLogoMainLinkedin_(1).png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          'Aurigraph',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Color(0xFF000080),
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
                  'Create Account',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                ),
                Text(
                  'Thank you for registering. \nPlease add your details below: ',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                ),
                Divider(),
                Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: usernameController,
                    onChanged: (_) => EasyDebounce.debounce(
                      'usernameController',
                      Duration(milliseconds: 2000),
                      () => setState(() {}),
                    ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'username',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      suffixIcon: usernameController!.text.isNotEmpty
                          ? InkWell(
                              onTap: () => setState(
                                () => usernameController?.clear(),
                              ),
                              child: Icon(
                                Icons.clear,
                                color: Color(0xFF757575),
                                size: 22,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  onChanged: (_) => EasyDebounce.debounce(
                    'passwordController',
                    Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  onFieldSubmitted: (_) async {
                    registrationAPIResponse = await RegistrationCall.call(
                      username: usernameController!.text,
                      password: passwordController!.text,
                      firstname: firstnameController!.text,
                      lastname: lastnameController!.text,
                      emailID: emailController!.text,
                      mobilenumber: int.parse(mobilenumberController!.text),
                    );
                    if ((registrationAPIResponse!?.succeeded ?? true)) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccountAadharWidget(
                            newusercreatemsg: getJsonField(
                              (registrationAPIResponse?.jsonBody ?? ''),
                              r'''$.registrationStatus''',
                            ),
                          ),
                        ),
                      );
                    } else {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccountWidget(),
                        ),
                      );
                    }

                    setState(() {});
                  },
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'password',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    suffixIcon: passwordController!.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => passwordController?.clear(),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  controller: firstnameController,
                  onChanged: (_) => EasyDebounce.debounce(
                    'firstnameController',
                    Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'first name',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    suffixIcon: firstnameController!.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => firstnameController?.clear(),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  controller: lastnameController,
                  onChanged: (_) => EasyDebounce.debounce(
                    'lastnameController',
                    Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'last name',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    suffixIcon: lastnameController!.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => lastnameController?.clear(),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  controller: mobilenumberController,
                  onChanged: (_) => EasyDebounce.debounce(
                    'mobilenumberController',
                    Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'mobile number',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    suffixIcon: mobilenumberController!.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => mobilenumberController?.clear(),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                ),
                TextFormField(
                  controller: emailController,
                  onChanged: (_) => EasyDebounce.debounce(
                    'emailController',
                    Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'email',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    suffixIcon: emailController!.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => emailController?.clear(),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                ),
                Divider(
                  color: Color(0xFF595959),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    registerAPIResponse = await RegistrationCall.call(
                      username: usernameController!.text,
                      password: passwordController!.text,
                      emailID: emailController!.text,
                      mobilenumber: int.parse(mobilenumberController!.text),
                      firstname: firstnameController!.text,
                      lastname: lastnameController!.text,
                    );
                    if ((registerAPIResponse!?.succeeded ?? true)) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccountAadharWidget(
                            newusercreatemsg:
                                (registerAPIResponse?.jsonBody ?? ''),
                          ),
                        ),
                      );
                    } else {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccountWidget(),
                        ),
                      );
                    }

                    setState(() {});
                  },
                  text: 'Submit',
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
