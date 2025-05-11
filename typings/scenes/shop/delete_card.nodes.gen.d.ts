declare module "godot" {
    interface SceneNodes {
        "scenes/shop/delete_card.tscn": {
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
        },
    }
}
