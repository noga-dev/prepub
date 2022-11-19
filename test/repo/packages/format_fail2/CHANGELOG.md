- deprecated `import 'hooks_riverpod/all.dart'`. Now everything is available with `hooks_riverpod/hooks_riverpod.dart`.
- removed the assert preventing ConsumerWidget's "watch" from being used after the `build` method completed.
  This allows "watch" to be used inside `ListView.builder`.
- `context.read(myProvider)` now accepts `ScopeProviders`