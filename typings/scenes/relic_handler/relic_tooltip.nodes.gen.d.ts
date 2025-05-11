declare module "godot" {
    interface SceneNodes {
        "scenes/relic_handler/relic_tooltip.tscn": {
            Background: Panel<
                {
                    MarginContainer: MarginContainer<
                        {
                            RelicTooltip: RichTextLabel<
                                {
                                    "@VScrollBar@22325": VScrollBar<{}>,
                                }
                            >,
                        }
                    >,
                }
            >,
        },
    }
}
