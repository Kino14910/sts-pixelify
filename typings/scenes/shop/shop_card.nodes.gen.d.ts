declare module "godot" {
    interface SceneNodes {
        "scenes/shop/shop_card.tscn": {
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
                                            "@VScrollBar@22354": VScrollBar<{}>,
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
        },
    }
}
