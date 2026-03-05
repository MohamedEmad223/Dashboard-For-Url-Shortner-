import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkSelectorCard extends StatefulWidget {
  final bool isFromMyLinks;
  final String customUrl;
  final ValueChanged<bool> onModeChanged;
  final ValueChanged<String> onUrlChanged;

  const LinkSelectorCard({
    super.key,
    required this.isFromMyLinks,
    required this.customUrl,
    required this.onModeChanged,
    required this.onUrlChanged,
  });

  @override
  State<LinkSelectorCard> createState() => _LinkSelectorCardState();
}

class _LinkSelectorCardState extends State<LinkSelectorCard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.isFromMyLinks ? 0 : 1,
    );
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        widget.onModeChanged(_tabController.index == 0);
      }
    });
  }

  @override
  void didUpdateWidget(LinkSelectorCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    final targetIndex = widget.isFromMyLinks ? 0 : 1;
    if (_tabController.index != targetIndex) {
      _tabController.animateTo(targetIndex);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12.r,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.isFromMyLinks
                ?
                'Enter the link you want to Make a Qr code for ':'',
            style: GoogleFonts.cairo(
                fontSize: 12.sp, color: const Color(0xFF8A94A6)),
          ),
           SizedBox(height: 10.h),
          TextField(
            textAlign: TextAlign.left,
            style: GoogleFonts.cairo(fontSize: 14.sp),
            onChanged: widget.onUrlChanged,
            decoration: InputDecoration(
              hintText: widget.isFromMyLinks ? 'https://...' :'',
              hintStyle: GoogleFonts.cairo(
                  color: const Color(0xFFB0BAC9), fontSize: 13.sp),
              filled: true,
              fillColor: const Color(0xFFF8FAFC),
              contentPadding:
                   EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Color(0xFFEDF0F4)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Color(0xFFEDF0F4)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide:
                    const BorderSide(color: Color(0xFF0B8A9A), width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
