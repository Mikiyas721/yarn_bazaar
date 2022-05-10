import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/view_model.dart';

abstract class Controller {
  final BuildContext context;

  Controller(this.context);
  dispose();
}

class ControllerWithOutBloc extends Controller{
  ControllerWithOutBloc(BuildContext context) : super(context);

  @override
  dispose() {
  }
}

abstract class BlocController<B extends Bloc<E, S>, E extends BlocEvent, S extends BlocState>
    implements Controller {
  final Bloc bloc;
  final bool ownsBloc;
  final BuildContext context;
  late S _currentState;
  late StreamSubscription<S> _sub;

  BlocController(this.context, this.bloc, this.ownsBloc) {
    _currentState = bloc.state;
    _sub = bloc.stream<S>.listen((newState) {
      onStateChanged(_currentState, newState);
      _currentState = newState;
    });
  }

  onStateChanged(S previousState, S currentState);

  @override
  dispose() {
    _sub.cancel();
    if (ownsBloc) {
      bloc.close();
    }
  }
}

abstract class MultiBlocController implements Controller {
  final List<Bloc> blocs;
  late List<StreamSubscription> _subs;

  MultiBlocController(this.blocs) {
    _subs = blocs.map<StreamSubscription>((bloc) {
      return bloc.stream.listen((newState) {
        onStatesChanged(_currentStates);
      });
    }).toList();
  }

  List get _currentStates {
    return blocs.map((b) => b.state).toList();
  }

  onStatesChanged(List states);

  @override
  dispose() {
    _subs.forEach((sub) => sub.cancel());
  }
}

abstract class ViewModelController<VM extends ViewModel> implements Controller {
  Stream<ViewModel> get viewModelStream;
}

abstract class BlocViewModelController<
    B extends Bloc<E, S>,
    E extends BlocEvent,
    S extends BlocState,
    VM extends ViewModel> extends BlocController implements ViewModelController<VM> {
  late BehaviorSubject<VM> _subject;
  final List<StreamSubscription> subs = [];

  BlocViewModelController(
    BuildContext context,
    B bloc,
    bool ownsBloc,
  ) : super(
          context,
          bloc,
          ownsBloc,
        ) {
    _subject = BehaviorSubject.seeded(mapStateToViewModel(_currentState as S));
  }

  VM mapStateToViewModel(S s);

  VM get currentViewModel {
    return _subject.value;
  }

  BehaviorSubject<VM> get viewModelStream {
    return _subject;
  }

  listen(Stream s) {
    subs.add(s.listen((event) {
      onStateChanged(bloc.state, bloc.state);
    }));
  }

  @override
  onStateChanged(BlocState currentState, BlocState newState) {
    final newViewModel = mapStateToViewModel(newState as S);
    if (currentViewModel != newViewModel) {
      _subject.add(newViewModel);
    }
  }

  @override
  dispose() {
    super.dispose();
    _subject.close();
    subs.forEach((e) => e.cancel());
  }
}

abstract class MultiBlocViewModelController<VM extends ViewModel> extends MultiBlocController
    implements ViewModelController<VM> {
  late BehaviorSubject<VM> _subject;

  MultiBlocViewModelController(List<Bloc> blocs) : super(blocs) {
    _subject = BehaviorSubject.seeded(mapStatesToViewModel(_currentStates));
  }

  VM mapStatesToViewModel(List states);

  VM get currentViewModel {
    return _subject.value;
  }

  Stream<VM> get viewModelStream {
    return _subject;
  }

  @override
  onStatesChanged(List states) {
    final newViewModel = mapStatesToViewModel(states);
    if (currentViewModel != newViewModel) {
      _subject.add(newViewModel);
    }
  }

  @override
  dispose() {
    super.dispose();
    _subject.close();
  }
}
