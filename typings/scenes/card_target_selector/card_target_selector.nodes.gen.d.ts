declare module "godot" {
    interface SceneNodes {
        "scenes/card_target_selector/card_target_selector.tscn": {
            Area2D: Area2D<
                {
                    CollisionShape2D: CollisionShape2D<{}>,
                }
            >,
            CanvasLayer: CanvasLayer<
                {
                    CardArc: Line2D<{}>,
                }
            >,
        },
    }
}
