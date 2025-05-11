declare module "godot" {
    interface SceneNodes {
        "scenes/shop/shop.tscn": {
            BackgroundLayer: CanvasLayer<
                {
                    Background: TextureRect<{}>,
                }
            >,
            DecorationLayer: CanvasLayer<
                {
                    Shopkeeper: TextureRect<{}>,
                    ShopkeeperAnimation: AnimationPlayer<{}>,
                    BlinkTimer: Timer<{}>,
                }
            >,
            UILayer: CanvasLayer<
                {
                    BackButton: Button<{}>,
                    ShopContent: VBoxContainer<
                        {
                            Cards: HBoxContainer<
                                {
                                    ShopCard: VBoxContainer<
                                        {
                                            CardContainer: CenterContainer<
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
                                                                            "@VScrollBar@22347": VScrollBar<{}>,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                        }
                                                    >,
                                                }
                                            >,
                                            Price: HBoxContainer<
                                                {
                                                    PriceLabel: Label<{}>,
                                                    GoldIcon: TextureRect<{}>,
                                                }
                                            >,
                                        }
                                    >,
                                    ShopCard2: VBoxContainer<
                                        {
                                            CardContainer: CenterContainer<
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
                                                                            "@VScrollBar@22348": VScrollBar<{}>,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                        }
                                                    >,
                                                }
                                            >,
                                            Price: HBoxContainer<
                                                {
                                                    PriceLabel: Label<{}>,
                                                    GoldIcon: TextureRect<{}>,
                                                }
                                            >,
                                        }
                                    >,
                                    ShopCard3: VBoxContainer<
                                        {
                                            CardContainer: CenterContainer<
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
                                                                            "@VScrollBar@22349": VScrollBar<{}>,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                        }
                                                    >,
                                                }
                                            >,
                                            Price: HBoxContainer<
                                                {
                                                    PriceLabel: Label<{}>,
                                                    GoldIcon: TextureRect<{}>,
                                                }
                                            >,
                                        }
                                    >,
                                    ShopCard4: VBoxContainer<
                                        {
                                            CardContainer: CenterContainer<
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
                                                                            "@VScrollBar@22350": VScrollBar<{}>,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                        }
                                                    >,
                                                }
                                            >,
                                            Price: HBoxContainer<
                                                {
                                                    PriceLabel: Label<{}>,
                                                    GoldIcon: TextureRect<{}>,
                                                }
                                            >,
                                        }
                                    >,
                                    ShopCard5: VBoxContainer<
                                        {
                                            CardContainer: CenterContainer<
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
                                                                            "@VScrollBar@22351": VScrollBar<{}>,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                        }
                                                    >,
                                                }
                                            >,
                                            Price: HBoxContainer<
                                                {
                                                    PriceLabel: Label<{}>,
                                                    GoldIcon: TextureRect<{}>,
                                                }
                                            >,
                                        }
                                    >,
                                }
                            >,
                            HBoxContainer: HBoxContainer<
                                {
                                    ColorlessCards: HBoxContainer<
                                        {
                                            ShopCard6: VBoxContainer<
                                                {
                                                    CardContainer: CenterContainer<
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
                                                                                    "@VScrollBar@22352": VScrollBar<{}>,
                                                                                }
                                                                            >,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                        }
                                                    >,
                                                    Price: HBoxContainer<
                                                        {
                                                            PriceLabel: Label<{}>,
                                                            GoldIcon: TextureRect<{}>,
                                                        }
                                                    >,
                                                }
                                            >,
                                            ShopCard7: VBoxContainer<
                                                {
                                                    CardContainer: CenterContainer<
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
                                                                                    "@VScrollBar@22353": VScrollBar<{}>,
                                                                                }
                                                                            >,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                        }
                                                    >,
                                                    Price: HBoxContainer<
                                                        {
                                                            PriceLabel: Label<{}>,
                                                            GoldIcon: TextureRect<{}>,
                                                        }
                                                    >,
                                                }
                                            >,
                                        }
                                    >,
                                    VBoxContainer: VBoxContainer<
                                        {
                                            Relics: HBoxContainer<
                                                {
                                                    ShopRelic: VBoxContainer<
                                                        {
                                                            RelicContainer: CenterContainer<
                                                                {
                                                                    RelicUI: Control<
                                                                        {
                                                                            Icon: TextureRect<{}>,
                                                                            AnimationPlayer: AnimationPlayer<{}>,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                            Price: HBoxContainer<
                                                                {
                                                                    PriceLabel: Label<{}>,
                                                                    GoldIcon: TextureRect<{}>,
                                                                }
                                                            >,
                                                        }
                                                    >,
                                                    ShopRelic2: VBoxContainer<
                                                        {
                                                            RelicContainer: CenterContainer<
                                                                {
                                                                    RelicUI: Control<
                                                                        {
                                                                            Icon: TextureRect<{}>,
                                                                            AnimationPlayer: AnimationPlayer<{}>,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                            Price: HBoxContainer<
                                                                {
                                                                    PriceLabel: Label<{}>,
                                                                    GoldIcon: TextureRect<{}>,
                                                                }
                                                            >,
                                                        }
                                                    >,
                                                    ShopRelic3: VBoxContainer<
                                                        {
                                                            RelicContainer: CenterContainer<
                                                                {
                                                                    RelicUI: Control<
                                                                        {
                                                                            Icon: TextureRect<{}>,
                                                                            AnimationPlayer: AnimationPlayer<{}>,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                            Price: HBoxContainer<
                                                                {
                                                                    PriceLabel: Label<{}>,
                                                                    GoldIcon: TextureRect<{}>,
                                                                }
                                                            >,
                                                        }
                                                    >,
                                                }
                                            >,
                                            Potions: HBoxContainer<
                                                {
                                                    ShopRelic: VBoxContainer<
                                                        {
                                                            RelicContainer: CenterContainer<
                                                                {
                                                                    RelicUI: Control<
                                                                        {
                                                                            Icon: TextureRect<{}>,
                                                                            AnimationPlayer: AnimationPlayer<{}>,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                            Price: HBoxContainer<
                                                                {
                                                                    PriceLabel: Label<{}>,
                                                                    GoldIcon: TextureRect<{}>,
                                                                }
                                                            >,
                                                        }
                                                    >,
                                                    ShopRelic2: VBoxContainer<
                                                        {
                                                            RelicContainer: CenterContainer<
                                                                {
                                                                    RelicUI: Control<
                                                                        {
                                                                            Icon: TextureRect<{}>,
                                                                            AnimationPlayer: AnimationPlayer<{}>,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                            Price: HBoxContainer<
                                                                {
                                                                    PriceLabel: Label<{}>,
                                                                    GoldIcon: TextureRect<{}>,
                                                                }
                                                            >,
                                                        }
                                                    >,
                                                    ShopRelic3: VBoxContainer<
                                                        {
                                                            RelicContainer: CenterContainer<
                                                                {
                                                                    RelicUI: Control<
                                                                        {
                                                                            Icon: TextureRect<{}>,
                                                                            AnimationPlayer: AnimationPlayer<{}>,
                                                                        }
                                                                    >,
                                                                }
                                                            >,
                                                            Price: HBoxContainer<
                                                                {
                                                                    PriceLabel: Label<{}>,
                                                                    GoldIcon: TextureRect<{}>,
                                                                }
                                                            >,
                                                        }
                                                    >,
                                                }
                                            >,
                                        }
                                    >,
                                    DeleteCard: VBoxContainer<
                                        {
                                            ButtonContainer: CenterContainer<
                                                {
                                                    DeleteButton: TextureButton<
                                                        {
                                                            TextureRect: TextureRect<{}>,
                                                        }
                                                    >,
                                                }
                                            >,
                                            Price: HBoxContainer<
                                                {
                                                    PriceLabel: Label<{}>,
                                                    GoldIcon: TextureRect<{}>,
                                                }
                                            >,
                                        }
                                    >,
                                }
                            >,
                        }
                    >,
                }
            >,
            ModifierHandler: Node<
                {
                    ShopCostModifier: Node<{}>,
                }
            >,
        },
    }
}
