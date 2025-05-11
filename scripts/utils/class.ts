export type ConstructorOf<T, Args extends any[] = any[]> = new (...args: Args) => T

export function constructorOf<T>(inst: T): ConstructorOf<T> {
    return Reflect.getPrototypeOf(inst as any)?.constructor as ConstructorOf<T>
}

export function interceptConstructor<T, R extends object>(ctor: ConstructorOf<T>, interceptor: (ctor: ConstructorOf<T>, args: any[]) => R) {
    return new Proxy(ctor, {
        construct(ctor, args) {
            const newInst = interceptor.call(undefined, ctor, args)
            if (newInst) {
                return newInst
            }

            return Reflect.construct(ctor, args) as unknown as R
        }
    })
}

export function getCtorName(ctor: any) {
    return constructorOf(ctor)?.name
}