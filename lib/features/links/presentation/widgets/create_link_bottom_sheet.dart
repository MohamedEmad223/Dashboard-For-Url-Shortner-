import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/pressable_card.dart';

class CreateLinkBottomSheet extends StatefulWidget {
  final Function(String originalUrl, String? customAlias, String? title) onCreateLink;

  const CreateLinkBottomSheet({
    super.key,
    required this.onCreateLink,
  });

  @override
  State<CreateLinkBottomSheet> createState() => _CreateLinkBottomSheetState();
}

class _CreateLinkBottomSheetState extends State<CreateLinkBottomSheet> {
  final _originalUrlCtrl = TextEditingController();
  final _customAliasCtrl = TextEditingController();
  final _titleCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _originalUrlCtrl.dispose();
    _customAliasCtrl.dispose();
    _titleCtrl.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onCreateLink(
        _originalUrlCtrl.text,
        _customAliasCtrl.text.isNotEmpty ? _customAliasCtrl.text : null,
        _titleCtrl.text.isNotEmpty ? _titleCtrl.text : null,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20.w,
        right: 20.w,
        top: 16.h,
      ),
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDDE3EC),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
               SizedBox(height: 20.h),
              Text(
                'Create New Link',
                style: GoogleFonts.cairo(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF0F1E2E),
                ),
              ),
               SizedBox(height: 4.h),
              Text(
                'Enter the original URL and optionally customize the short link',
                style: GoogleFonts.cairo(
                  fontSize: 13.sp,
                  color: const Color(0xFF8A94A6),
                ),
              ),
               SizedBox(height: 20.h),
              _SheetInput(
                label: 'Original URL',
                hint: 'https://example.com/...',
                controller: _originalUrlCtrl,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Original URL is required';
                  }
                  if (!Uri.tryParse(value)!.hasAbsolutePath ?? false) {
                    return 'Please enter a valid URL';
                  }
                  return null;
                },
              ),
               SizedBox(height: 14.h),
              _SheetInput(
                label: 'Custom Alias (Optional)',
                hint: 'my-short-link',
                controller: _customAliasCtrl,
                validator: (value) => null,
              ),
               SizedBox(height: 14.h),
              _SheetInput(
                label: 'Title (Optional)',
                hint: 'Link title...',
                controller: _titleCtrl,
                validator: (value) => null,
              ),
               SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: PressableCard(
                  onTap: _submitForm,
                  child: Container(
                    padding:  EdgeInsets.symmetric(vertical: 14.h),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF076475), Color(0xFF13C5D8)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(14.r),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0B8A9A).withOpacity(0.35),
                          blurRadius: 12.r,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Create Link',
                        style: GoogleFonts.cairo(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
               SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _SheetInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const _SheetInput({
    required this.label,
    required this.hint,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.cairo(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF4A5568),
          ),
        ),
         SizedBox(height: 6.h),
        TextFormField(
          controller: controller,
          textAlign: TextAlign.left,
          style: GoogleFonts.cairo(fontSize: 14.sp),
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.cairo(
              color: const Color(0xFFB0BAC9),
              fontSize: 13.sp,
            ),
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            contentPadding:  EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 13.h,
            ),
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
              borderSide: const BorderSide(
                color: Color(0xFF0B8A9A),
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide:  BorderSide(
                color: Colors.red,
                width: 1.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}