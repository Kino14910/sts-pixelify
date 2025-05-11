declare module "godot" {
    interface SceneNodes {
        "scenes/ui/battle_over_panel.tscn": {
            TextureRect: TextureRect<
                {
                    Label: Label<{}>,
                }
            >,
            VBoxContainer: VBoxContainer<
                {
                    ContinueButton: Button<{}>,
                    MainMenuButton: Button<{}>,
                }
            >,
        },
    }
}
