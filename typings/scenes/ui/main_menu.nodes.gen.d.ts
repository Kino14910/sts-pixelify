declare module "godot" {
    interface SceneNodes {
        "scenes/ui/main_menu.tscn": {
            Background: TextureRect<{}>,
            VBoxContainer: VBoxContainer<
                {
                    NewGame: PanelContainer<
                        {
                            Gradient: PanelContainer<
                                {
                                    Button: Button<{}>,
                                }
                            >,
                        }
                    >,
                    Continue: PanelContainer<
                        {
                            Gradient: PanelContainer<
                                {
                                    Button: Button<{}>,
                                }
                            >,
                        }
                    >,
                    Exit: PanelContainer<
                        {
                            Gradient: PanelContainer<
                                {
                                    Button: Button<{}>,
                                }
                            >,
                        }
                    >,
                }
            >,
        },
    }
}
