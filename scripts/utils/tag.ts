export function tag(str: string) {
    return new Tag(str)
}

export class Tag {
    constructor(public tag: string) {
        if (!this.isValid()) {
            throw new Error("Invalid tag format")
        }
    }

    isValid(): boolean {
        return /^[a-zA-Z]\w*(\.\w+)*$/.test(this.tag)
    }

    match(tag: Tag, exactlyMatching=false) {
        if (exactlyMatching) {
            return this.tag === tag.tag
        }

        const self = this.tag.split('.')
        const other = tag.tag.split('.')

        if (self.length < other.length) {
            return false
        }

        for (let i = 0; i < other.length; i++) {
            const selfPart = self[i]
            const otherPart = other[i]
            
            if (selfPart !== otherPart) {
                return false
            }
        }

        return true
    }

    matchTags(tags: Tag[]) {
        for (const tag of tags) {
            if (!this.match(tag)) {
                return false
            }
        }

        return true
    }

}