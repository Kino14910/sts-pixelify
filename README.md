# sts-pixelify

![Godot 4.x](https://img.shields.io/badge/Godot-4.x-%23478cbf)
![License](https://img.shields.io/badge/License-MIT-green)

sts-pixelify 是一款使用Godot引擎开发的类《杀戮尖塔》策略卡牌游戏，结合Roguelike元素与DBG（卡组构筑游戏）玩法。玩家将在随机生成的地图中冒险，通过组合独特的卡牌和遗物，挑战不断增强的敌人。

**项目状态**: 早期开发阶段 | 可玩原型 | 褒姒跑路中

![游戏截图1](https://s2.loli.net/2025/04/24/XeSyHUWA6atomqV.png)


## 核心特色

### 卡牌战斗系统
- **动态能量机制**: 每回合获得可自由分配的能量点，用于攻击、防御或特殊能力
- **状态效果系统**: 包含中毒、易伤、虚弱等20+种状态效果
- **多角色支持**: 战士/盗贼/法师等不同职业（开发中）

### Roguelike元素
- **程序生成地图**: 包含战斗节点、商店、随机事件等
- **永久死亡机制**: 每次失败后需重新开始
- **随机卡牌奖励**: 每场战斗后从3张随机卡牌中选择奖励
- **遗物系统**: 收集遗物

### 卡牌系统
- **可收集卡牌**: 分为攻击/技能/能力/诅咒四大类
- **自定义卡牌模板**: 方便mod制作者添加新卡牌

### 技术实现
- 基于Godot 4的ECS架构（实验性）
- 全响应式UI系统
- 可扩展的事件总线系统

## 安装指南

### 系统需求
- Godot 4.3或更高版本
- 支持OpenGL ES 3.0的显卡
- 2GB可用存储空间

### 下载与运行
1. 克隆仓库：
   ```bash
   git clone https://github.com/Kino14910/sts-pixelify.git

2. 使用Godot4.3编辑器打开项目
3. 运行`Main.tscn`场景

### 构建可执行文件
1. 安装Godot导出模板
2. 配置导出预设：
   - Windows: Desktop → Windows
   - Linux: Desktop → Linux/X11
   - macOS: Desktop → macOS
3. 执行导出操作

## 项目结构

```shell
sts-pixelify
├─assets
├─autoloads
├─scripts
│  ├─actions
│  ├─cards
│  ├─characters
│  ├─dungeons
│  ├─monsters
│  ├─monster_actions
│  ├─powers
│  ├─relics
├─resources
│  ├─curves
│  ├─custom_resources
│  └─theme
├─scenes
└─script_templates
```

## 开发者指南

### 添加新卡牌
1. 在`res://scripts/cards`目录创建脚本，复制下面的模板或者在新建界面的模板选择`Node: Card Logic`
   ```gdscript
   extends Card
   
   func apply_actions(targets: Array[Node]) -> void:
   	DamageAction.new(targets, damage)
   ```
   
2. 在`res://scripts/cards`目录创建资源

   在检查器中填写对应的数据

3. 将创建的脚本拖拽到对应资源的检查器底部`RefCounted/Script`处,替换原来的`Card.gd`



### 添加新怪物

1. 在`res://scripts/monster`目录创建目录，名字为你想创建的怪物名字
2. 复制一份`res://scenes/monster/monster_action_picker.tscn`到目录下，在场景中新建`Node`子节点
3. 创建脚本，复制下面的模板或者在新建界面的模板选择`Node: MonsterAction`
4. 如果想写公共的怪物action脚本，请写在`res://scripts/monster_actions`目录下
5. 添加好怪物之后在`res://scripts/dungeons`目录下对应的目录添加地牢房间，然后在`battle_stats_pool.tres`中注册对应的dungeon（最好将资源拖入到检查器中，直接在检查器中选择可能触发godot引擎bug导致引用出错）



### 添加新Action/Power/Relic

1. 在对应目录创建脚本，在新建界面的模板选择对应模板
2. 创建对应的资源并应用脚本





### 事件系统示例（以抽卡事件为例）

```gdscript
# 注册事件
Events.gd
signal draw_cards


# 订阅事件
player_handler.gd
Events.draw_cards.connect(draw_cards)


# 发送事件
draw_card_action.gd
Events.draw_cards.emit(amount)
```



## 参与贡献

我们欢迎各种形式的贡献：
1. 提交Issue报告BUG或建议新功能
2. Fork仓库并提交Pull Request
3. 协助完善文档或翻译
4. 创作美术/音效资源（需遵循CC-BY协议）

### 代码规范
- 使用GDScript静态类型
- 节点命名使用snake_case
- 遵循Godot官方代码风格

## 路线图

### v0.1.0 (当前)
✅ 基础战斗框架

✅卡牌系统原型

✅第一个可玩角色

✅地牢地图生成

✅遗物系统

✅商店系统

### v0.2.0 (规划中)

🔧更多卡牌和角色事件

🔧卡图

🔧floor变量名和MonsterAction中的player变量名需要修改，否则会分别出现一个报错

 🔧BATTLE_REWARD_SCENE不应该是一个单独场景，应该在battle中，胜利后使其visible=true

❌药水

❌卡牌选择界面（用于非随机卡牌选择如生存者）

❌卡牌升级

❌卡牌数据使用文件保存，i18n

### 长期目标
- Steam平台发布
- 创意工坊支持
- 移动端适配

## 特别感谢
- 《杀戮尖塔》开发团队带来的灵感
- Godot引擎社区提供的支持
- itch.io提供的美术素材

## 许可证

本项目采用MIT许可证 - 详见[LICENSE](LICENSE)文件
