declare module "godot" {
    interface SceneNodes {
        "scenes/ui/stats_ui.tscn": {
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
        },
    }
}
