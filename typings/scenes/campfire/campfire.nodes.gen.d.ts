declare module "godot" {
    interface SceneNodes {
        "scenes/campfire/campfire.tscn": {
            BGLayer: CanvasLayer<
                {
                    Background: TextureRect<{}>,
                }
            >,
            ParticlesLayer: CanvasLayer<
                {
                    GPUParticles2D: GPUParticles2D<{}>,
                }
            >,
            UILayer: CanvasLayer<
                {
                    UI: VBoxContainer<
                        {
                            Title: Label<{}>,
                            Spacer: Control<{}>,
                            RestButton: Button<{}>,
                            Description: Label<{}>,
                        }
                    >,
                }
            >,
            AnimationPlayer: AnimationPlayer<{}>,
        },
    }
}
