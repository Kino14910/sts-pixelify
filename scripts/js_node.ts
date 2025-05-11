import { int64, Node } from "godot"

export default class JsNode extends Node {
    getSibling(idx: int64): Node {
        return this.get_parent().get_child(idx)
    }

    getSiblings() {
        return this.get_parent().get_children()
    }
}