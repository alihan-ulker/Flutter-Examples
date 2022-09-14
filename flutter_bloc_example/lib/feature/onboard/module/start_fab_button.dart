part of '../on_board_view.dart';

//floating  action button part olarak ayrildi
//sadece onboard view de kullanilabilir hale geldi
//

class _StartFabButton extends StatelessWidget {
  const _StartFabButton({Key? key, required this.isLastPage, this.onPressed})
      : super(key: key);

  final VoidCallback? onPressed;

  final bool isLastPage;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Text(isLastPage ? UIText.start : UIText.nextButton),
    );
  }
}
