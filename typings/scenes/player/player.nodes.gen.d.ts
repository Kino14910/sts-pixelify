declare module "godot" {
    interface SceneNodes {
        "scenes/player/player.tscn": {
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
        },
    }
}
