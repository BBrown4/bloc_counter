import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test(
        'the initial state for the CounterCubit is CounterState(counterValue: 0)',
        () {
      expect(
        counterCubit.state,
        CounterState(counterValue: 0),
      );
    });

    blocTest(
      'the logic.cubit should emit a CounterState(counterValue: 1, wasIncremented: true) when logic.cubit.increment() is called',
      build: () => counterCubit,
      act: (cubit) => counterCubit.increment(),
      expect: () => [
        CounterState(counterValue: 1, wasIncremented: true),
      ],
    );

    blocTest(
      'the logic.cubit should emit a CounterState(counterValue: -1, wasIncremented: false) when logic.cubit.decrement() is called',
      build: () => counterCubit,
      act: (cubit) => counterCubit.decrement(),
      expect: () => [
        CounterState(counterValue: -1, wasIncremented: false),
      ],
    );
  });
}
