# Plan: Improve `failure` and `initial` handlers in `BlocBuilderForOverView`

The `failure` case currently renders a plain `Text` with the error message, and `initial` is a no-op empty callback. Both should be improved: `failure` should show a meaningful UI (e.g. an error widget with a retry button), and `initial` should trigger data loading or show an empty/loading placeholder.

## Steps

1. **Handle `initial` state** in `bloc_builder_for_over_view.dart`: replace the empty `initial: () {}` with `SizedBox.shrink()` or trigger `OverViewCubit.overView()` via `context.read<OverViewCubit>().overView()` inside an `initial` callback that returns an empty widget.

2. **Improve `failure` state UI** in `bloc_builder_for_over_view.dart`: replace the bare `Center(child: Text(errorMessage.message))` with a more informative widget — e.g. a `Column` with an error icon, the `errorMessage.message` text, and a retry `TextButton` that calls `context.read<OverViewCubit>().overView()`.

3. **Optionally extract a reusable `ErrorStateWidget`** into a new file under `lib/features/home/presentation/widgets/` that accepts a `message` string and an `onRetry` callback, keeping `BlocBuilderForOverView` clean.

## Further Considerations

1. **`initial` behavior**: Should `initial` silently show nothing (`SizedBox.shrink()`) and let the parent screen trigger loading, or should it auto-trigger `overView()` and return a placeholder? Depends on where `overView()` is first called.
2. **Error UI style**: Should the failure widget match the app's existing design (colors, fonts from `assets/fonts/cairo`)? If so, the retry button and error text should use the app's theme.
3. **`buildWhen` coverage**: The current `buildWhen` already covers `loading`, `success`, and `failure` — `initial` is effectively filtered out, so the `initial: () {}` is mostly harmless but dead code. Confirm whether `initial` should even be reachable in the builder.

