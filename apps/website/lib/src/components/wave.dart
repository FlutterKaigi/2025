import 'dart:js_interop';
import 'dart:math';

import 'package:flutterkaigi_2025_website/app.dart';
import 'package:web/web.dart';

HTMLElement get waveCanvas {
  final canvas =
      HTMLCanvasElement()
        ..id = 'wave'
        ..style.width = '100%'
        ..style.height = '20vh';

  void resize() {
    canvas.width = window.innerWidth;
  }

  resize();
  window.addEventListener('resize', resize.toJS);
  onRemove(() {
    window.removeEventListener('resize', resize.toJS);
  });

  var tick = 0.0;
  var isAnimating = false;
  final pulsePoints = List<double>.filled(36, 0);
  final targetPoints = List<double>.filled(36, 0);
  var returningToZero = false;
  var returnProgress = 1.0;
  var nextPulseTime = DateTime.now().millisecondsSinceEpoch; // 次のパルスのタイミング

  void updateTargets() {
    for (var i = 0; i < targetPoints.length; i++) {
      final position = i / (targetPoints.length - 1);
      final center = (position - 0.5).abs() * 2.5;
      final amplitude = pow(1 - center, 3);
      targetPoints[i] = (Random().nextDouble() * 2 - 1 + 0.5) * amplitude;
    }
  }

  void render() {
    final ctx = canvas.getContext('2d') as CanvasRenderingContext2D?;
    if (ctx == null) {
      window.requestAnimationFrame(((num _) => render()).toJS);
      return;
    }

    final w = canvas.width;
    final h = canvas.height;
    ctx.clearRect(0, 0, w, h);

    final amplitude = h * 0.4;
    final baseY = h * 0.5;
    const speed = 0.2;
    const returnSpeed = 0.09;

    // 2秒間隔でパルスを生成
    final now = DateTime.now().millisecondsSinceEpoch;
    if (now >= nextPulseTime && !isAnimating && !returningToZero) {
      isAnimating = true;
      updateTargets();
      tick = 0;
      nextPulseTime = now + 1000;
    }

    // 状態の更新
    if (isAnimating && tick > pi * 0.75 && !returningToZero) {
      returningToZero = true;
      returnProgress = 1;
      tick = 0;
    } else if (returningToZero) {
      returnProgress = max(0, returnProgress - returnSpeed);

      if (returnProgress <= 0) {
        returningToZero = false;
        isAnimating = false;
        tick = 0;
        pulsePoints.fillRange(0, pulsePoints.length, 0);
        targetPoints.fillRange(0, targetPoints.length, 0);
      }
    }

    // パルスポイントの更新（アニメーション中）
    if (isAnimating && !returningToZero) {
      for (var i = 0; i < pulsePoints.length; i++) {
        pulsePoints[i] += (targetPoints[i] - pulsePoints[i]) * speed;
      }
    } else if (returningToZero) {
      // 定常状態への遷移中
      for (var i = 0; i < pulsePoints.length; i++) {
        pulsePoints[i] = pulsePoints[i] * returnProgress;
      }
    }

    // 波形の描画（常に表示）
    ctx.beginPath();
    final segmentWidth = w / (pulsePoints.length - 1);

    // 開始点
    const startX = 0;
    final startY = baseY + amplitude * pulsePoints[0];
    ctx.moveTo(startX, startY);

    // 各点をベジェ曲線で接続
    for (var i = 1; i < pulsePoints.length; i++) {
      final x = i * segmentWidth;
      final y = baseY + amplitude * pulsePoints[i];
      final prevX = (i - 1) * segmentWidth;
      final prevY = baseY + amplitude * pulsePoints[i - 1];

      // 制御点を計算（間隔を0.3から0.4に狭める）
      final cp1X = prevX + segmentWidth * 0.4;
      final cp1Y = prevY;
      final cp2X = x - segmentWidth * 0.4;
      final cp2Y = y;

      // 3次ベジェ曲線で描画
      ctx.bezierCurveTo(cp1X, cp1Y, cp2X, cp2Y, x, y);
    }

    final grd = ctx.createLinearGradient(0, 0, w, 0);
    grd.addColorStop(0, 'rgba(229,6,50,0.8)');
    grd.addColorStop(1, 'rgba(2,125,253,0.8)');

    ctx.lineWidth = 3;
    ctx.strokeStyle = grd;
    ctx.stroke();

    tick += speed;
    window.requestAnimationFrame(((num _) => render()).toJS);
  }

  render();

  return canvas;
}
