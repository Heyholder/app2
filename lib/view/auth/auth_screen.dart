import 'package:app/states/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _birthEditingController = TextEditingController();
  final TextEditingController _genderEditingController =
      TextEditingController();
  final TextEditingController _phoneNumberEditingController =
      TextEditingController();
  final TextEditingController _codeEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameEditingController.dispose();
    _birthEditingController.dispose();
    _genderEditingController.dispose();
    _phoneNumberEditingController.dispose();
    _codeEditingController.dispose();
    super.dispose();
  }

  VerificationStatus _verificationStatus = VerificationStatus.none;

  Widget emptyBox() {
    return SizedBox(
      height: 12.0.h,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            body: SingleChildScrollView(
          child: IgnorePointer(
            ignoring: _verificationStatus == VerificationStatus.verifying,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 59.h,
                    ),
                    Text(
                      '휴대폰 본인인증을 통해',
                      style: TextStyle(
                          fontSize: 22.0.sp, fontWeight: FontWeight.w500),
                    ),
                    Text('회원여부 확인 및',
                        style: TextStyle(
                            fontSize: 22.0.sp, fontWeight: FontWeight.w500)),
                    Text('가입을 진행합니다.',
                        style: TextStyle(
                            fontSize: 22.0.sp, fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 61.0.h,
                    ),
                    SizedBox(
                      height: 58.0.h,
                      child: TextFormField(
                        controller: _nameEditingController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20.0.w),
                            hintText: "이름을 입력해주세요.",
                            hintStyle: TextStyle(
                                fontSize: 16.0.sp,
                                color: Theme.of(context).hintColor),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffE5E5E5)),
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    emptyBox(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150.0.w,
                          child: TextFormField(
                            controller: _birthEditingController,
                            validator: (birth) {
                              String pattern =
                                  r'(\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1]))';
                              RegExp regExp = RegExp(pattern);
                              if (birth != null && regExp.hasMatch(birth)) {
                                return null;
                              } else {
                                return '생년월일을 확인해주세요.';
                              }
                            },
                            inputFormatters: [MaskedInputFormatter("000000")],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                hintText: "900101",
                                hintStyle: TextStyle(
                                    fontSize: 16.0.sp,
                                    color: Theme.of(context).hintColor),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xffE5E5E5)),
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        ),
                        SizedBox(
                          width: 29.0.w,
                          height: 58.0.h,
                          child: const Center(
                              child: Text(
                            "-",
                          )),
                        ),
                        SizedBox(
                          width: 46.0.w,
                          child: TextFormField(
                            controller: _genderEditingController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                hintText: "1",
                                hintStyle: TextStyle(
                                    fontSize: 16.0.sp,
                                    color: Theme.of(context).hintColor),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xffE5E5E5)),
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        ),
                        SizedBox(
                          width: 8.0.w,
                        ),
                        SizedBox(
                          width: 88.0.w,
                          height: 58.0.h,
                          child: Center(
                            child: Text(
                              "\u22c5" * 6,
                              style: TextStyle(
                                  fontSize: 33.0.sp,
                                  letterSpacing: 7.0.w,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        )
                      ],
                    ),
                    emptyBox(),
                    SizedBox(
                      height: 58.0.h,
                      child: TextFormField(
                        // TODO: 통신사 선택 창 만들기.
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20.0.w),
                            hintText: "통신사 선택",
                            hintStyle: TextStyle(
                                fontSize: 16.0.sp,
                                color: Theme.of(context).hintColor),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffE5E5E5)),
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    emptyBox(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 210.0.w,
                          child: TextFormField(
                            controller: _phoneNumberEditingController,
                            validator: (phoneNumber) {
                              String pattern =
                                  r'(^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$)';
                              RegExp regExp = RegExp(pattern);
                              if (phoneNumber != null &&
                                  regExp.hasMatch(phoneNumber)) {
                                return null;
                              } else {
                                return '전화번호를 확인해주세요.';
                              }
                            },
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              MaskedInputFormatter("000-0000-0000"),
                            ],
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                hintText: "휴대폰번호를 입력해주세요.",
                                hintStyle: TextStyle(
                                    fontSize: 16.0.sp,
                                    color: Theme.of(context).hintColor),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xffE5E5E5)),
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        ),
                        SizedBox(
                          width: 7.0.w,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final nameText = _nameEditingController.text;
                            final birthText = _birthEditingController.text;
                            final genderText = _genderEditingController.text;
                            final phoneText =
                                _phoneNumberEditingController.text;
                            if (nameText.isNotEmpty &&
                                birthText.isNotEmpty &&
                                genderText.isNotEmpty &&
                                phoneText.isNotEmpty) {
                              // TODO: 모든 내용이 입력 되면 버튼 활성화, 인증 회사와 조회 연결.
                              if (_formKey.currentState != null) {
                                bool passed = _formKey.currentState!.validate();
                                if (passed) {
                                  setState(() {
                                    _verificationStatus =
                                        VerificationStatus.codeSent;
                                  });
                                }
                              }
                            } else {
                              null;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(108.w, 58.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: const Text("인증번호 요청"),
                        )
                      ],
                    ),
                    emptyBox(),
                    AnimatedOpacity(
                      duration: const Duration(seconds: 1),
                      opacity: getVerification(_verificationStatus)["opacity"],
                      child: SizedBox(
                        height: 58.0.h,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            //TODO: 000-000-0000 번호 가능하게 변경 할 것.
                            MaskedInputFormatter("000-0000-0000")
                          ],
                          controller: _codeEditingController,
                          enabled:
                              getVerification(_verificationStatus)["enabled"],
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20.0.w),
                              hintText: "인증번호를 입력해주세요.",
                              hintStyle: TextStyle(
                                  fontSize: 16.0.sp,
                                  color: Theme.of(context).hintColor),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffE5E5E5)),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 148.h,
                    ),
                    ElevatedButton(
                      onPressed: () => attemptVerify(context),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(345.w, 50.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child:
                          (_verificationStatus == VerificationStatus.verifying)
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text("본인 인증하기"),
                    )
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }

  getVerification(VerificationStatus status) {
    var verification = {"enabled": false, "opacity": 0.0};
    switch (status) {
      case VerificationStatus.none:
        return verification;
      case VerificationStatus.codeSent:
      case VerificationStatus.verifying:
      case VerificationStatus.verificationDone:
        verification["enabled"] = true;
        verification["opacity"] = 1.0;
        return verification;
    }
  }

  void attemptVerify(BuildContext context) async {
    var authNotifier = context.read<AuthenticationNotifier>();

    setState(() {
      _verificationStatus = VerificationStatus.verifying;
    });

    authNotifier.setUserAuth(true);
    setState(() {
      _verificationStatus = VerificationStatus.verificationDone;
    });
  }
}

enum VerificationStatus { none, codeSent, verifying, verificationDone }
