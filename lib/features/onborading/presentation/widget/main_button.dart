import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:updent/core/util/colors_ext.dart';
import 'package:vector_graphics/vector_graphics.dart';

class MainButton extends StatelessWidget {
  final String? title;
  final Color? fillColor;
  final Color? textColor;
  final bool isLoading;
  final bool disableButton;
  final bool showIcon;
  final String iconPath;

  final VoidCallback? onBtnSelected;

  const MainButton({
    Key? key,
    this.title,
    this.fillColor,
    this.isLoading = false,
    this.textColor,
    this.onBtnSelected,
    this.disableButton = false,
    this.iconPath = '',
    this.showIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBtnAnimation(context);
  }

  Widget _buildBtnAnimation(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.06, // Responsive height
        alignment: FractionalOffset.center,
        decoration: BoxDecoration(
          color: fillColor,
          border: Border.all(
            color: Theme.of(
              context,
            ).colorScheme.copyWith().colorGrey800.withOpacity(0.2),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child:
            isLoading
                ? SizedBox(
                  height: 10,
                  width: 10,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    color:
                        fillColor != null
                            ? fillColor == Theme.of(context).colorScheme.primary
                                ? Colors.white
                                : Theme.of(context).colorScheme.primary
                            : Colors.white,
                  ),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (showIcon) ...[
                      SvgPicture(AssetBytesLoader(iconPath)),
                      const SizedBox(width: 8),
                    ],
                    Flexible(
                      child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.04,
                        ), // Responsive font size
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
      ),
      onPressed:
          disableButton
              ? null
              : () {
                if (onBtnSelected != null) {
                  onBtnSelected!();
                }
              },
    );
  }
}
