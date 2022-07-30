import 'package:app/service/agendas_service.dart';
import 'package:app/view/stock_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AgendaListScreen extends StatefulWidget {
  const AgendaListScreen({Key? key}) : super(key: key);

  @override
  State<AgendaListScreen> createState() => _AgendaListScreenState();
}

class _AgendaListScreenState extends State<AgendaListScreen> {
  final String _stockCode = "000000";
  var _agenda;
  bool _init = false;

  @override
  void initState() {
    if (!_init) {
      _onRefresh();
      _init = true;
    }
    super.initState();
  }

  Future<void> _onRefresh() async {
    if (_agenda != null) {
      _agenda.clear();
    }
    _agenda = await AgendasService().getAgendas(_stockCode);
    setState(() {});
  }

  Widget noContentContainer(context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            child: Container(
              width: 375.0.w,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/noConent.svg',
                    width: 122.0.w,
                    height: 92.42.h,
                  ),
                  SizedBox(
                    height: 40.6.h,
                  ),
                  Text(
                    '주주제안이 없어요.',
                    style: TextStyle(
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff696c75)),
                  ),
                  SizedBox(
                    height: 8.0.h,
                  ),
                  Text(
                    '첫 주주제안을 작성해 보시는 건 어떨까요?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 12.0.sp),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          StockInfo(),
        ],
      ),
    );
  }
}
