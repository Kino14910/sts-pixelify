declare module "godot" {
    interface SceneNodes {
        "scripts/dungeons/exordium/strong/gremlin.tscn": {
            GremlinFat: Area2D<
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
            GremlinWarrior: Area2D<
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
            GremlinTsundere: Area2D<
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
