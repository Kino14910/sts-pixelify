declare module "godot" {
    interface SceneNodes {
        "scenes/ui/card_rewards.tscn": {
            VBoxContainer: VBoxContainer<
                {
                    Cards: HBoxContainer<
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
                                                    "@VScrollBar@22364": VScrollBar<{}>,
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
                                                    "@VScrollBar@22365": VScrollBar<{}>,
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
                                                    "@VScrollBar@22366": VScrollBar<{}>,
                                                }
                                            >,
                                        }
                                    >,
                                }
                            >,
                        }
                    >,
                    SkipCardReward: Button<{}>,
                }
            >,
        },
    }
}
