declare module "godot" {
    interface SceneNodes {
        "scenes/ui/card_menu_ui.tscn": {
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
                            "@VScrollBar@22355": VScrollBar<{}>,
                        }
                    >,
                }
            >,
        },
    }
}
