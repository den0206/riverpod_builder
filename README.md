<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->


# Purpose

Easy to use awesome package Riverpod for some design pattern.
## Features

### View (builder)

``` dart
  @override
  Widget build(BuildContext context) {
    // wrap this buider 
    return RiverpodBuilder(
      provider: ViewProviders.firstViewModelProvider,
      builder: (context, ref, vm, state, reader) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('First View'),
            automaticallyImplyLeading: false,
          )
          ...
```

### property

- `context` means build context
- `ref` means WidgetRef
- `vm` ref.watch(provider.notifier);
- `state` ref.watch(provider);
- `reader` ref.read(provider.notifier);

### View Model

``` dart
class FirstViewModel extends BaseViewModel<FirstViewState> {
  @override
  get instanse => const FirstViewState();

  int get count => state.count;

  // listen another provider
  SecondViewModel get secondVM =>
      widgetRef.read(secondViewModelProvider.notifier);

  @override
  void onInit() async{
    // Asynchronous processing is also possible .
    await Future.delayed(const Duration(seconds: 1));
    super.onInit();
  }

  void addCount() {
    state = state.copyWith(count: state.count + 1);
  }

  void showNextView() {
    // has context(Build Context)
    // no arguments need to be passed.
    Navigator.of(context).pushNamed("second_view");
  }

  ...
```

### property

- `context` means build context
- `ref` means WidgetRef
- `widgetRef` means PrividerRef
- `state` this state;
- `onInit` (function) triger when this class init;
- `onDispose` (function) triger when this class close;

# 
 Writing Documents more detail... 
