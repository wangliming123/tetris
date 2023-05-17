

import 'dart:ui';

import 'package:get/get.dart';

enum GameStates {
  ///随时可以开启一把惊险而又刺激的俄罗斯方块
  none,

  ///游戏暂停中，方块的下落将会停止
  paused,

  ///游戏正在进行中，方块正在下落
  ///按键可交互
  running,

  ///游戏正在重置
  ///重置完成之后，[GameController]状态将会迁移为[none]
  reset,

  ///下落方块已经到达底部，此时正在将方块固定在游戏矩阵中
  ///固定完成之后，将会立即开始下一个方块的下落任务
  mixing,

  ///正在消除行
  ///消除完成之后，将会立刻开始下一个方块的下落任务
  clear,

  ///方块快速下坠到底部
  drop,
}

class GameState {

  static const game_matrix_h = 20;
  static const game_matrix_w = 10;

  final data = <List<int>>[].obs;


  ///在 [build] 方法中于 [_data]混合，形成一个新的矩阵
  ///[_mask]矩阵的宽高与 [_data] 一致
  ///对于任意的 _mask[x,y] ：
  /// 如果值为 0,则对 [_data]没有任何影响
  /// 如果值为 -1,则表示 [_data] 中该行不显示
  /// 如果值为 1，则表示 [_data] 中该行高亮
  final mask = <List<int>>[].obs;

  ///屏幕展示数据
  ///0: 空砖块
  ///1: 普通砖块
  ///2: 高亮砖块
  final mixedData = <List<int>>[].obs;

  GameState() {
    //填充砖块数据
    for (int i = 0; i < game_matrix_h; i++) {
      data.add(List.filled(game_matrix_w, 0));
      mask.add(List.filled(game_matrix_w, 0));
      mixedData.add(List.filled(game_matrix_w, 0));
    }
  }

  var states = GameStates.none.obs;

  Rx<Image?> material = null.obs;




}