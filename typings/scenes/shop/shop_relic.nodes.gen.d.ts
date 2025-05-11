declare module "godot" {
    interface SceneNodes {
        "scenes/shop/shop_relic.tscn": {
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
        },
    }
}
