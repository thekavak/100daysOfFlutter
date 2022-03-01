part of '../on_board_view.dart';

class _StartTabButton extends StatelessWidget {
  const _StartTabButton({
    Key? key,
    required this.isLastPage,
    this.onPressed,
  }) : super(key: key);
  final String _nextTitle = 'Next';
  final String _startTitle = 'Start';
  final bool isLastPage;

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Text(isLastPage ? _startTitle : _nextTitle),
    );
  }
}
