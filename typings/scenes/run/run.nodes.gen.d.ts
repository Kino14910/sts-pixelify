declare module "godot" {
    interface SceneNodes {
        "scenes/run/run.tscn": {
            Map: Node2D<
                {
                    Visuals: Node2D<
                        {
                            Lines: Node2D<{}>,
                            Rooms: Node2D<{}>,
                        }
                    >,
                    Camera2D: Camera2D<{}>,
                    MapGenerator: Node<{}>,
                    MapBackground: CanvasLayer<
                        {
                            Background: TextureRect<{}>,
                        }
                    >,
                    Player: Area2D<
                        {
                            AnimatedSprite2D: AnimatedSprite2D<{}>,
                            Hitbox: CollisionShape2D<{}>,
                            StatsUI: Control<
                                {
                                    Health: TextureProgressBar<
                                        {
                                            HealthLabel: Label<{}>,
                                        }
                                    >,
                                    Block: TextureRect<
                                        {
                                            BlockLabel: Label<{}>,
                                        }
                                    >,
                                }
                            >,
                            SelectedIndicator: NinePatchRect<{}>,
                            PowerHandler: GridContainer<{}>,
                            ModifierHandler: Node<
                                {
                                    DamagDealtModifier: Node<{}>,
                                    DamagTakenModifier: Node<{}>,
                                    CardCostModifier: Node<{}>,
                                }
                            >,
                        }
                    >,
                }
            >,
            CurrentView: Node<{}>,
            DebugButtons: VBoxContainer<
                {
                    MapButton: Button<{}>,
                    BattleButton: Button<{}>,
                    ShopButton: Button<{}>,
                    TreasureButton: Button<{}>,
                    RewardsButton: Button<{}>,
                    CampfireButton: Button<{}>,
                }
            >,
            TopBar: CanvasLayer<
                {
                    Background: ColorRect<
                        {
                            MarginContainer: MarginContainer<
                                {
                                    BarItems: HBoxContainer<
                                        {
                                            HealthUI: HBoxContainer<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    Label: Label<{}>,
                                                }
                                            >,
                                            GoldUI: HBoxContainer<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    Label: Label<{}>,
                                                }
                                            >,
                                            PotionsUI: HBoxContainer<
                                                {
                                                    Potion1: TextureRect<{}>,
                                                    Potion2: TextureRect<{}>,
                                                    Potion3: TextureRect<{}>,
                                                }
                                            >,
                                            FloorUI: HBoxContainer<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    Label: Label<{}>,
                                                }
                                            >,
                                            Placeholder: Control<{}>,
                                            DeckButton: TextureButton<
                                                {
                                                    Label: Label<{}>,
                                                }
                                            >,
                                        }
                                    >,
                                }
                            >,
                        }
                    >,
                    RelicHandler: HBoxContainer<
                        {
                            LeftButton: TextureButton<{}>,
                            RelicsControl: Control<
                                {
                                    Relics: HBoxContainer<
                                        {
                                            RelicUI: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI2: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI3: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI4: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI5: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI6: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI7: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI8: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI9: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI10: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI11: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI12: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI13: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI14: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI15: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI16: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI17: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI18: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI19: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI20: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI21: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI22: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI23: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                            RelicUI24: Control<
                                                {
                                                    Icon: TextureRect<{}>,
                                                    AnimationPlayer: AnimationPlayer<{}>,
                                                }
                                            >,
                                        }
                                    >,
                                }
                            >,
                            RightButton: TextureButton<{}>,
                        }
                    >,
                    RelicTooltip: Control<
                        {
                            Background: Panel<
                                {
                                    MarginContainer: MarginContainer<
                                        {
                                            RelicTooltip: RichTextLabel<
                                                {
                                                    "@VScrollBar@22326": VScrollBar<{}>,
                                                }
                                            >,
                                        }
                                    >,
                                }
                            >,
                        }
                    >,
                    DeckView: Control<
                        {
                            Background: ColorRect<{}>,
                            MarginContainer: MarginContainer<
                                {
                                    VBoxContainer: VBoxContainer<
                                        {
                                            Title: Label<{}>,
                                            ScrollContainer: ScrollContainer<
                                                {
                                                    Cards: GridContainer<
                                                        {
                                                            CardMenuUI: CenterContainer<
                                                                {
                                                                    Visuals: Control<
                                                                        {
                                                                            Panel: Panel<{}>,
                                                                            Banner: ColorRect<
                                                                                {
                                                                                    CardName: Label<{}>,
                                                                                }
                                                                            >,
                                                                            CostIcon: TextureRect<
                                                                                {
                                                                                    Cost: Label<{}>,
                                                                                }
                                                                            >,
                                                                            Icon: TextureRect<{}>,
                                                                            Description: RichTextLabel<
                                                                                {
                                                                                    "@VScrollBar@22327": VScrollBar<{}>,
                                                                                }
                                                                            >,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                            CardMenuUI2: CenterContainer<
                                                                {
                                                                    Visuals: Control<
                                                                        {
                                                                            Panel: Panel<{}>,
                                                                            Banner: ColorRect<
                                                                                {
                                                                                    CardName: Label<{}>,
                                                                                }
                                                                            >,
                                                                            CostIcon: TextureRect<
                                                                                {
                                                                                    Cost: Label<{}>,
                                                                                }
                                                                            >,
                                                                            Icon: TextureRect<{}>,
                                                                            Description: RichTextLabel<
                                                                                {
                                                                                    "@VScrollBar@22328": VScrollBar<{}>,
                                                                                }
                                                                            >,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                            CardMenuUI3: CenterContainer<
                                                                {
                                                                    Visuals: Control<
                                                                        {
                                                                            Panel: Panel<{}>,
                                                                            Banner: ColorRect<
                                                                                {
                                                                                    CardName: Label<{}>,
                                                                                }
                                                                            >,
                                                                            CostIcon: TextureRect<
                                                                                {
                                                                                    Cost: Label<{}>,
                                                                                }
                                                                            >,
                                                                            Icon: TextureRect<{}>,
                                                                            Description: RichTextLabel<
                                                                                {
                                                                                    "@VScrollBar@22329": VScrollBar<{}>,
                                                                                }
                                                                            >,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                            CardMenuUI4: CenterContainer<
                                                                {
                                                                    Visuals: Control<
                                                                        {
                                                                            Panel: Panel<{}>,
                                                                            Banner: ColorRect<
                                                                                {
                                                                                    CardName: Label<{}>,
                                                                                }
                                                                            >,
                                                                            CostIcon: TextureRect<
                                                                                {
                                                                                    Cost: Label<{}>,
                                                                                }
                                                                            >,
                                                                            Icon: TextureRect<{}>,
                                                                            Description: RichTextLabel<
                                                                                {
                                                                                    "@VScrollBar@22330": VScrollBar<{}>,
                                                                                }
                                                                            >,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                            CardMenuUI5: CenterContainer<
                                                                {
                                                                    Visuals: Control<
                                                                        {
                                                                            Panel: Panel<{}>,
                                                                            Banner: ColorRect<
                                                                                {
                                                                                    CardName: Label<{}>,
                                                                                }
                                                                            >,
                                                                            CostIcon: TextureRect<
                                                                                {
                                                                                    Cost: Label<{}>,
                                                                                }
                                                                            >,
                                                                            Icon: TextureRect<{}>,
                                                                            Description: RichTextLabel<
                                                                                {
                                                                                    "@VScrollBar@22331": VScrollBar<{}>,
                                                                                }
                                                                            >,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                            CardMenuUI6: CenterContainer<
                                                                {
                                                                    Visuals: Control<
                                                                        {
                                                                            Panel: Panel<{}>,
                                                                            Banner: ColorRect<
                                                                                {
                                                                                    CardName: Label<{}>,
                                                                                }
                                                                            >,
                                                                            CostIcon: TextureRect<
                                                                                {
                                                                                    Cost: Label<{}>,
                                                                                }
                                                                            >,
                                                                            Icon: TextureRect<{}>,
                                                                            Description: RichTextLabel<
                                                                                {
                                                                                    "@VScrollBar@22332": VScrollBar<{}>,
                                                                                }
                                                                            >,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                            CardMenuUI7: CenterContainer<
                                                                {
                                                                    Visuals: Control<
                                                                        {
                                                                            Panel: Panel<{}>,
                                                                            Banner: ColorRect<
                                                                                {
                                                                                    CardName: Label<{}>,
                                                                                }
                                                                            >,
                                                                            CostIcon: TextureRect<
                                                                                {
                                                                                    Cost: Label<{}>,
                                                                                }
                                                                            >,
                                                                            Icon: TextureRect<{}>,
                                                                            Description: RichTextLabel<
                                                                                {
                                                                                    "@VScrollBar@22333": VScrollBar<{}>,
                                                                                }
                                                                            >,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                            CardMenuUI8: CenterContainer<
                                                                {
                                                                    Visuals: Control<
                                                                        {
                                                                            Panel: Panel<{}>,
                                                                            Banner: ColorRect<
                                                                                {
                                                                                    CardName: Label<{}>,
                                                                                }
                                                                            >,
                                                                            CostIcon: TextureRect<
                                                                                {
                                                                                    Cost: Label<{}>,
                                                                                }
                                                                            >,
                                                                            Icon: TextureRect<{}>,
                                                                            Description: RichTextLabel<
                                                                                {
                                                                                    "@VScrollBar@22334": VScrollBar<{}>,
                                                                                }
                                                                            >,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                            MarginContainer: MarginContainer<{}>,
                                                        }
                                                    >,
                                                    _h_scroll: HScrollBar<{}>,
                                                    _v_scroll: VScrollBar<{}>,
                                                }
                                            >,
                                        }
                                    >,
                                }
                            >,
                            BackButton: Button<{}>,
                        }
                    >,
                }
            >,
            PauseMenu: CanvasLayer<
                {
                    PanelContainer: PanelContainer<
                        {
                            Label: Label<{}>,
                            Control: Control<
                                {
                                    VolumeContainer: HBoxContainer<
                                        {
                                            Label: Label<{}>,
                                            Volume: HSlider<{}>,
                                        }
                                    >,
                                    MusicContainer: HBoxContainer<
                                        {
                                            Label: Label<{}>,
                                            Volume: HSlider<{}>,
                                        }
                                    >,
                                    SFXContainer: HBoxContainer<
                                        {
                                            Label: Label<{}>,
                                            Volume: HSlider<{}>,
                                        }
                                    >,
                                    MuteContainer: HBoxContainer<
                                        {
                                            Label: Label<{}>,
                                            Mute: CheckBox<{}>,
                                        }
                                    >,
                                    ResolutionContainer: HBoxContainer<
                                        {
                                            Label: Label<{}>,
                                            OptionButton: OptionButton<
                                                {
                                                    "@PopupMenu@22340": PopupMenu<
                                                        {
                                                            "@PanelContainer@22335": PanelContainer<
                                                                {
                                                                    "@ScrollContainer@22336": ScrollContainer<
                                                                        {
                                                                            "@Control@22337": Control<{}>,
                                                                            _h_scroll: HScrollBar<{}>,
                                                                            _v_scroll: VScrollBar<{}>,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                            "@Timer@22338": Timer<{}>,
                                                            "@Timer@22339": Timer<{}>,
                                                        }
                                                    >,
                                                }
                                            >,
                                        }
                                    >,
                                    WindowModeContainer: HBoxContainer<
                                        {
                                            Label: Label<{}>,
                                            OptionButton: OptionButton<
                                                {
                                                    "@PopupMenu@22346": PopupMenu<
                                                        {
                                                            "@PanelContainer@22341": PanelContainer<
                                                                {
                                                                    "@ScrollContainer@22342": ScrollContainer<
                                                                        {
                                                                            "@Control@22343": Control<{}>,
                                                                            _h_scroll: HScrollBar<{}>,
                                                                            _v_scroll: VScrollBar<{}>,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                            "@Timer@22344": Timer<{}>,
                                                            "@Timer@22345": Timer<{}>,
                                                        }
                                                    >,
                                                }
                                            >,
                                        }
                                    >,
                                }
                            >,
                            HBoxContainer: HBoxContainer<
                                {
                                    BackToGameButton: Button<{}>,
                                    SaveAndQuitButton: Button<{}>,
                                }
                            >,
                        }
                    >,
                }
            >,
            Tutorial: CanvasLayer<
                {
                    Bg: ColorRect<{}>,
                    health: Panel<{}>,
                    health2: Label<{}>,
                    money: Panel<{}>,
                    money2: Label<{}>,
                    potion: Panel<{}>,
                    potion2: Label<{}>,
                    floor: Panel<{}>,
                    floor2: Label<{}>,
                    relics: Panel<{}>,
                    relics2: Label<{}>,
                    deck: Panel<{}>,
                    deck2: Label<{}>,
                    Sprite2D: Sprite2D<{}>,
                    battle: Label<{}>,
                    Sprite2D2: Sprite2D<{}>,
                    campfire: Label<{}>,
                    Sprite2D3: Sprite2D<{}>,
                    shop: Label<{}>,
                    Sprite2D4: Sprite2D<{}>,
                    event: Label<{}>,
                    Sprite2D5: Sprite2D<{}>,
                    treasure: Label<{}>,
                    Button: Button<{}>,
                }
            >,
            BattleTutorial: CanvasLayer<
                {
                    Bg: ColorRect<{}>,
                    health: Panel<{}>,
                    health2: Label<{}>,
                    money: Panel<{}>,
                    money2: Label<{}>,
                    potion: Panel<{}>,
                    potion2: Label<{}>,
                    floor: Panel<{}>,
                    floor2: Label<{}>,
                    relics: Panel<{}>,
                    relics2: Label<{}>,
                    deck: Panel<{}>,
                    deck2: Label<{}>,
                    drawPile: Panel<{}>,
                    drawPile2: Label<{}>,
                    discard: Panel<{}>,
                    discard2: Label<{}>,
                    hand: Panel<{}>,
                    hand2: Label<{}>,
                    energy: Panel<{}>,
                    energy2: Label<{}>,
                    exhaust2: Panel<{}>,
                    exhaust: Label<{}>,
                    exhaust3: Label<{}>,
                    Button: Button<{}>,
                }
            >,
            Test: Node<{}>,
        },
    }
}
