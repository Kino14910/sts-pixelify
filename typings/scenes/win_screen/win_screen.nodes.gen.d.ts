declare module "godot" {
    interface SceneNodes {
        "scenes/win_screen/win_screen.tscn": {
            Background: TextureRect<{}>,
            CharacterPortrait: TextureRect<{}>,
            VboxContainer: VBoxContainer<
                {
                    Message: Label<{}>,
                    MainMenuButton: Button<{}>,
                }
            >,
        },
    }
}
