declare module "godot" {
    interface SceneNodes {
        "scenes/treasure/treasure.tscn": {
            Background: TextureRect<{}>,
            BackgroundDimmer: ColorRect<{}>,
            TreasureChest: TextureRect<
                {
                    AnimationPlayer: AnimationPlayer<{}>,
                    GPUParticles2D: GPUParticles2D<{}>,
                }
            >,
        },
    }
}
