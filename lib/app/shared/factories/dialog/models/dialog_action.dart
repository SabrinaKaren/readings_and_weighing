class DialogAction<T> {

  T child;
  Function onPressed;
  
  DialogAction({
    required this.child,
    required this.onPressed,
  });

}