abstract class LayoutStates {}

class InitLayoutState extends LayoutStates {}

class ChangeLanguageState extends LayoutStates {
  final bool langEN;

  ChangeLanguageState(this.langEN);
}

class ChangeScreenState extends LayoutStates {
  final int index;

  ChangeScreenState(this.index);
}
