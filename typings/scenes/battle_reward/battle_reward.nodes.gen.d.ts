declare module "godot" {
    interface SceneNodes {
        "scenes/battle_reward/battle_reward.tscn": {
            Background: TextureRect<{}>,
            BackgroundDimmer: ColorRect<{}>,
            VBoxContainer: VBoxContainer<
                {
                    Label: Label<{}>,
                    RewardContainer: PanelContainer<
                        {
                            MarginContainer: MarginContainer<
                                {
                                    Rewards: VBoxContainer<
                                        {
                                            GoldReward: Button<
                                                {
                                                    MarginContainer: MarginContainer<
                                                        {
                                                            HBoxContainer: HBoxContainer<
                                                                {
                                                                    CustomIcon: TextureRect<{}>,
                                                                    CustomText: Label<{}>,
                                                                }
                                                            >,
                                                        }
                                                    >,
                                                }
                                            >,
                                            CardReward: Button<
                                                {
                                                    MarginContainer: MarginContainer<
                                                        {
                                                            HBoxContainer: HBoxContainer<
                                                                {
                                                                    CustomIcon: TextureRect<{}>,
                                                                    CustomText: Label<{}>,
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
                        }
                    >,
                    BackButton: Button<{}>,
                }
            >,
        },
    }
}
