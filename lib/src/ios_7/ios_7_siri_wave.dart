import 'package:flutter/material.dart';

import '../../siri_wave.dart';
import 'ios_7_siri_wave_painter.dart';

class IOS7SiriWave extends StatefulWidget {
  const IOS7SiriWave({
    super.key,
    required this.controller,
    this.options = const SiriWaveOptions(),
  });

  final SiriWaveController controller;
  final SiriWaveOptions options;

  @override
  IOS7SiriWaveState createState() => IOS7SiriWaveState();
}

class IOS7SiriWaveState extends State<IOS7SiriWave>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      // Since AnimationController's value is not used in the animation, the
      // duration value does not have any affect on the animation.
      duration: const Duration(seconds: 1),
    );

    if (widget.controller.amplitude > 0 && widget.controller.speed > 0) {
      _animationController.repeat();
    }
    if(widget.controller.isPause){

      _animationController.stop(canceled:false);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant IOS7SiriWave oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_animationController.isAnimating &&
        (widget.controller.amplitude == 0 || widget.controller.speed == 0)) {
      _animationController.stop(canceled: false);
    } else if (!_animationController.isAnimating &&
        (widget.controller.amplitude > 0 && widget.controller.speed > 0)) {
      _animationController.repeat();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customPaint = CustomPaint(
      painter: IOS7SiriWavePainter(
        animationController: _animationController,
        controller: widget.controller,
        waveColorsList: widget.options.colorsList,
      ),
    );

    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) => customPaint,
    );
  }
}
