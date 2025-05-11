declare module "godot" {
    interface SceneNodes {
        "scenes/map/map_room.tscn": {
            Visuals: Node2D<
                {
                    Line2D: Line2D<{}>,
                    Sprite2D: Sprite2D<{}>,
                }
            >,
            CollisionShape2D: CollisionShape2D<{}>,
            AnimationPlayer: AnimationPlayer<{}>,
        },
    }
}
