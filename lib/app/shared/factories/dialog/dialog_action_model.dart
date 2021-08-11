class DialogActionModel<T> {

  T child;
  Function onPressed;
  
  DialogActionModel({
    required this.child,
    required this.onPressed,
  });

}