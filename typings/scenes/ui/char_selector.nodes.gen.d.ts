declare module "godot" {
    interface SceneNodes {
        "scenes/ui/char_selector.tscn": {
            Background: TextureRect<{}>,
            Label: Label<{}>,
            HBoxContainer: HBoxContainer<
                {
                    IronClad: Button<
                        {
                            TextureRect: TextureRect<{}>,
                        }
                    >,
                    TheSlient: Button<
                        {
                            TextureRect: TextureRect<{}>,
                        }
                    >,
                    Detect: Button<
                        {
                            TextureRect: TextureRect<{}>,
                        }
                    >,
                    Watcher: Button<
                        {
                            TextureRect: TextureRect<{}>,
                        }
                    >,
                }
            >,
            StartButton: Button<{}>,
            VBoxContainer: VBoxContainer<
                {
                    Name: TextureRect<{}>,
                    Description: Label<{}>,
                }
            >,
            Container: Control<
                {
                    CharacterPortrait: TextureRect<{}>,
                }
            >,
        },
    }
}
