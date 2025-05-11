declare module "godot" {
    interface SceneNodes {
        "scenes/map/map.tscn": {
            Visuals: Node2D<
                {
                    Lines: Node2D<{}>,
                    Rooms: Node2D<{}>,
                }
            >,
            Camera2D: Camera2D<{}>,
            MapGenerator: Node<{}>,
            MapBackground: CanvasLayer<
                {
                    Background: TextureRect<{}>,
                }
            >,
        },
    }
}
