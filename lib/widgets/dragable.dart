import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

/// Adds an additional property onDragUpdate that receives calls during a drag event
/// All other behaviour is inherited from Draggable
class TrackingDraggable<T> extends Draggable<T> {
  final GestureDragUpdateCallback onDragUpdate;

  TrackingDraggable(
      {Key key,
      @required child,
      @required feedback,
      data,
      axis,
      childWhenDragging,
      feedbackOffset = Offset.zero,
      dragAnchor = DragAnchor.child,
      affinity,
      maxSimultaneousDrags,
      onDragStarted,
      onDraggableCanceled,
      onDragEnd,
      onDragCompleted,
      ignoringFeedbackSemantics = true,
      this.onDragUpdate})
      : super(
            key: key,
            child: child,
            feedback: feedback,
            data: data,
            axis: axis,
            childWhenDragging: childWhenDragging,
            feedbackOffset: feedbackOffset,
            dragAnchor: dragAnchor,
            affinity: affinity,
            maxSimultaneousDrags: maxSimultaneousDrags,
            onDragStarted: onDragStarted,
            onDraggableCanceled: onDraggableCanceled,
            onDragEnd: onDragEnd,
            onDragCompleted: onDragCompleted,
            ignoringFeedbackSemantics: ignoringFeedbackSemantics);

  /// Hooks into the Draggable start point so we can proxy Drag events and provide updates
  @protected
  MultiDragGestureRecognizer<MultiDragPointerState> createRecognizer(
      GestureMultiDragStartCallback onStart) {
    var originalRecognizer = super.createRecognizer(onStart);

    // Intercept the onStart and insert our proxy
    var originalOnStartFunction = originalRecognizer.onStart;

    originalRecognizer.onStart = (Offset position) {
      // Get the original Drag
      var originalDrag = originalOnStartFunction(position);
      // Proxy it
      return _DragProxy(originalDrag, this);
    };

    // We've now inserted our onStart, so return
    return originalRecognizer;
  }
}

class _DragProxy implements Drag {
  Drag _originalDrag;
  TrackingDraggable _ourTracker;

  _DragProxy(this._originalDrag, this._ourTracker);

  @override
  void cancel() {
    _originalDrag.cancel();
  }

  @override
  void end(DragEndDetails details) {
    _originalDrag.end(details);
  }

  @override
  void update(DragUpdateDetails details) {
    if (_ourTracker.onDragUpdate != null) {
      _ourTracker.onDragUpdate(details);
    }
    // Call the original as well.
    _originalDrag.update(details);
  }
}
