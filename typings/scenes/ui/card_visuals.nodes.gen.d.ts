declare module "godot" {
    interface SceneNodes {
        "scenes/ui/card_visuals.tscn": {
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
                    "@VScrollBar@22367": VScrollBar<{}>,
                }
            >,
        },
    }
}
