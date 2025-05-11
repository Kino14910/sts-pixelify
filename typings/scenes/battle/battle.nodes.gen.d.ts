declare module "godot" {
    interface SceneNodes {
        "scenes/battle/battle.tscn": {
            Background: Node2D<
                {
                    Background: Sprite2D<{}>,
                    Background2: Sprite2D<{}>,
                    Background3: Sprite2D<{}>,
                    Background4: Sprite2D<{}>,
                }
            >,
            CardDropArea: Area2D<
                {
                    CollisionShape2D: CollisionShape2D<{}>,
                }
            >,
            MonsterHandler: Node2D<
                {
                    LouseNormal: Area2D<
                        {
                            Sprite2D: Sprite2D<{}>,
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
                            IntentUI: HBoxContainer<
                                {
                                    Icon: TextureRect<{}>,
                                    Label: Label<{}>,
                                }
                            >,
                            PowerHandler: GridContainer<{}>,
                            ModifierHandler: Node<
                                {
                                    DamagDealtModifier: Node<{}>,
                                    DamagTakenModifier: Node<{}>,
                                }
                            >,
                        }
                    >,
                    LouseDefensive: Area2D<
                        {
                            Sprite2D: Sprite2D<{}>,
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
                            IntentUI: HBoxContainer<
                                {
                                    Icon: TextureRect<{}>,
                                    Label: Label<{}>,
                                }
                            >,
                            PowerHandler: GridContainer<{}>,
                            ModifierHandler: Node<
                                {
                                    DamagDealtModifier: Node<{}>,
                                    DamagTakenModifier: Node<{}>,
                                }
                            >,
                        }
                    >,
                }
            >,
            CardTargetSelector: Node2D<
                {
                    Area2D: Area2D<
                        {
                            CollisionShape2D: CollisionShape2D<{}>,
                        }
                    >,
                    CanvasLayer: CanvasLayer<
                        {
                            CardArc: Line2D<{}>,
                        }
                    >,
                }
            >,
            PlayerHandler: Node<{}>,
            BattleUI: CanvasLayer<
                {
                    Hand: Node2D<{}>,
                    EndTurnButton: Button<{}>,
                    EnergyUI: TextureRect<
                        {
                            EnergyLabel: Label<{}>,
                        }
                    >,
                    DrawPile: TextureButton<
                        {
                            Label: Label<{}>,
                        }
                    >,
                    DiscardPile: TextureButton<
                        {
                            Label: Label<{}>,
                        }
                    >,
                    ExhaustPile: TextureButton<
                        {
                            Label: Label<{}>,
                        }
                    >,
                    PowerTooltipsView: VFlowContainer<{}>,
                }
            >,
            BattleOverLayer: CanvasLayer<
                {
                    BattleOverPanel: Panel<
                        {
                            TextureRect: TextureRect<
                                {
                                    Label: Label<{}>,
                                }
                            >,
                            VBoxContainer: VBoxContainer<
                                {
                                    ContinueButton: Button<{}>,
                                    MainMenuButton: Button<{}>,
                                }
                            >,
                        }
                    >,
                }
            >,
            RedFlash: CanvasLayer<
                {
                    ColorRect: ColorRect<{}>,
                    Timer: Timer<{}>,
                }
            >,
            CardPileView: CanvasLayer<
                {
                    DrawPileView: Control<
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
                                                                                    "@VScrollBar@22300": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22301": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22302": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22303": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22304": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22305": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22306": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22307": VScrollBar<{}>,
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
                    DiscardPileView: Control<
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
                                                                                    "@VScrollBar@22308": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22309": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22310": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22311": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22312": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22313": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22314": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22315": VScrollBar<{}>,
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
                    ExhaustPileView: Control<
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
                                                                                    "@VScrollBar@22316": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22317": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22318": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22319": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22320": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22321": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22322": VScrollBar<{}>,
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
                                                                                    "@VScrollBar@22323": VScrollBar<{}>,
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
        },
    }
}
