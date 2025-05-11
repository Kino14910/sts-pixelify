declare module "godot" {
    interface SceneNodes {
        "scenes/card_ui/card_ui.tscn": {
            CardVisuals: Control<
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
                            "@VScrollBar@22324": VScrollBar<{}>,
                        }
                    >,
                }
            >,
            DropPointDetector: Area2D<
                {
                    CollisionShape2D: CollisionShape2D<{}>,
                }
            >,
            CardStateMachine: Node<
                {
                    BaseState: Node<{}>,
                    ClickedState: Node<{}>,
                    DraggingState: Node<{}>,
                    ReleasedState: Node<{}>,
                    AimingState: Node<{}>,
                }
            >,
        },
    }
}
