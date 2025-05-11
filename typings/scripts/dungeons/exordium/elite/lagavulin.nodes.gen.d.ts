declare module "godot" {
    interface SceneNodes {
        "scripts/dungeons/exordium/elite/lagavulin.tscn": {
            Lagavulin: Area2D<
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
        },
    }
}
