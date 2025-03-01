/** Binding to React.element enables the compatibility with v3 */
type element = React.element

@deprecated("Jsx 3 is deprecated, use jsx 4 instead") @val external null: element = "null"

@deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external float: float => element = "%identity"
@deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external int: int => element = "%identity"
@deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external string: string => element = "%identity"

@deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external array: array<element> => element = "%identity"

type componentLike<'props, 'return> = React.componentLike<'props, 'return>

type component<'props> = React.component<'props>

/* this function exists to prepare for making `component` abstract */
@deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external component: componentLike<'props, element> => component<'props> = "%identity"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external createElement: (component<'props>, 'props) => element = "createElement"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external cloneElement: (element, 'props) => element = "cloneElement"

@variadic @module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external createElementVariadic: (component<'props>, 'props, array<element>) => element =
  "createElement"

@module("react") @deprecated("Please use JSX syntax directly.")
external jsxKeyed: (component<'props>, 'props, string) => element = "jsx"

@module("react") @deprecated("Please use JSX syntax directly.")
external jsx: (component<'props>, 'props) => element = "jsx"

@module("react") @deprecated("Please use JSX syntax directly.")
external jsxs: (component<'props>, 'props) => element = "jsxs"

@module("react") @deprecated("Please use JSX syntax directly.")
external jsxsKeyed: (component<'props>, 'props, string) => element = "jsxs"

type ref<'value> = React.ref<'value> = {mutable current: 'value}

module Ref = {
  @deprecated("Please use the type React.ref instead")
  type t<'value> = ref<'value>

  @deprecated("Please directly read from ref.current instead") @get
  external current: ref<'value> => 'value = "current"

  @deprecated("Please directly assign to ref.current instead") @set
  external setCurrent: (ref<'value>, 'value) => unit = "current"
}

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external createRef: unit => ref<Js.nullable<'a>> = "createRef"

module Children = {
  @module("react") @scope("Children") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external map: (element, element => element) => element = "map"
  @module("react") @scope("Children") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external mapWithIndex: (element, @uncurry (element, int) => element) => element = "map"
  @module("react") @scope("Children") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external forEach: (element, element => unit) => unit = "forEach"
  @module("react") @scope("Children") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external forEachWithIndex: (element, @uncurry (element, int) => unit) => unit = "forEach"
  @module("react") @scope("Children") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external count: element => int = "count"
  @module("react") @scope("Children") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external only: element => element = "only"
  @module("react") @scope("Children") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external toArray: element => array<element> = "toArray"
}

module Context = {
  type t<'props> = React.Context.t<'props>

  @obj
  external makeProps: (
    ~value: 'props,
    ~children: element,
    unit,
  ) => {"value": 'props, "children": element} = ""

  @get @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external provider: t<'props> => component<{"value": 'props, "children": element}> = "Provider"
}

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external createContext: 'a => Context.t<'a> = "createContext"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external forwardRef: (@uncurry ('props, Js.Nullable.t<ref<'a>>) => element) => component<'props> =
  "forwardRef"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external memo: component<'props> => component<'props> = "memo"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external memoCustomCompareProps: (
  component<'props>,
  @uncurry ('props, 'props) => bool,
) => component<'props> = "memo"

module Fragment = {
  @obj @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external makeProps: (~children: element, ~key: 'key=?, unit) => {"children": element} = ""
  @module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external make: component<{
    "children": element,
  }> = "Fragment"
}

module StrictMode = {
  @obj @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external makeProps: (~children: element, ~key: 'key=?, unit) => {"children": element} = ""
  @module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external make: component<{
    "children": element,
  }> = "StrictMode"
}

module Suspense = {
  @obj @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external makeProps: (
    ~children: element=?,
    ~fallback: element=?,
    ~key: 'key=?,
    unit,
  ) => {"children": option<element>, "fallback": option<element>} = ""
  @module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external make: component<{
    "children": option<element>,
    "fallback": option<element>,
  }> = "Suspense"
}

/* HOOKS */

/*
 * Yeah, we know this api isn't great. tl;dr: useReducer instead.
 * It's because useState can take functions or non-function values and treats
 * them differently. Lazy initializer + callback which returns state is the
 * only way to safely have any type of state and be able to update it correctly.
 */
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useState: (@uncurry (unit => 'state)) => ('state, ('state => 'state) => unit) = "useState"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useReducer: (@uncurry ('state, 'action) => 'state, 'state) => ('state, 'action => unit) =
  "useReducer"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useReducerWithMapState: (
  @uncurry ('state, 'action) => 'state,
  'initialState,
  @uncurry ('initialState => 'state),
) => ('state, 'action => unit) = "useReducer"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useEffectOnEveryRender: (@uncurry (unit => option<unit => unit>)) => unit = "useEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useEffect: (@uncurry (unit => option<unit => unit>), 'deps) => unit = "useEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useEffect0: (@uncurry (unit => option<unit => unit>), @as(json`[]`) _) => unit =
  "useEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useEffect1: (@uncurry (unit => option<unit => unit>), array<'a>) => unit = "useEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useEffect2: (@uncurry (unit => option<unit => unit>), ('a, 'b)) => unit = "useEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useEffect3: (@uncurry (unit => option<unit => unit>), ('a, 'b, 'c)) => unit = "useEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useEffect4: (@uncurry (unit => option<unit => unit>), ('a, 'b, 'c, 'd)) => unit =
  "useEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useEffect5: (@uncurry (unit => option<unit => unit>), ('a, 'b, 'c, 'd, 'e)) => unit =
  "useEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useEffect6: (@uncurry (unit => option<unit => unit>), ('a, 'b, 'c, 'd, 'e, 'f)) => unit =
  "useEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useEffect7: (
  @uncurry (unit => option<unit => unit>),
  ('a, 'b, 'c, 'd, 'e, 'f, 'g),
) => unit = "useEffect"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useLayoutEffectOnEveryRender: (@uncurry (unit => option<unit => unit>)) => unit =
  "useLayoutEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useLayoutEffect: (@uncurry (unit => option<unit => unit>), 'deps) => unit =
  "useLayoutEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useLayoutEffect0: (@uncurry (unit => option<unit => unit>), @as(json`[]`) _) => unit =
  "useLayoutEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useLayoutEffect1: (@uncurry (unit => option<unit => unit>), array<'a>) => unit =
  "useLayoutEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useLayoutEffect2: (@uncurry (unit => option<unit => unit>), ('a, 'b)) => unit =
  "useLayoutEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useLayoutEffect3: (@uncurry (unit => option<unit => unit>), ('a, 'b, 'c)) => unit =
  "useLayoutEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useLayoutEffect4: (@uncurry (unit => option<unit => unit>), ('a, 'b, 'c, 'd)) => unit =
  "useLayoutEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useLayoutEffect5: (@uncurry (unit => option<unit => unit>), ('a, 'b, 'c, 'd, 'e)) => unit =
  "useLayoutEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useLayoutEffect6: (
  @uncurry (unit => option<unit => unit>),
  ('a, 'b, 'c, 'd, 'e, 'f),
) => unit = "useLayoutEffect"
@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useLayoutEffect7: (
  @uncurry (unit => option<unit => unit>),
  ('a, 'b, 'c, 'd, 'e, 'f, 'g),
) => unit = "useLayoutEffect"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useMemo: (@uncurry (unit => 'any), 'deps) => 'any = "useMemo"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useMemo0: (@uncurry (unit => 'any), @as(json`[]`) _) => 'any = "useMemo"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useMemo1: (@uncurry (unit => 'any), array<'a>) => 'any = "useMemo"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useMemo2: (@uncurry (unit => 'any), ('a, 'b)) => 'any = "useMemo"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useMemo3: (@uncurry (unit => 'any), ('a, 'b, 'c)) => 'any = "useMemo"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useMemo4: (@uncurry (unit => 'any), ('a, 'b, 'c, 'd)) => 'any = "useMemo"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useMemo5: (@uncurry (unit => 'any), ('a, 'b, 'c, 'd, 'e)) => 'any = "useMemo"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useMemo6: (@uncurry (unit => 'any), ('a, 'b, 'c, 'd, 'e, 'f)) => 'any = "useMemo"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useMemo7: (@uncurry (unit => 'any), ('a, 'b, 'c, 'd, 'e, 'f, 'g)) => 'any = "useMemo"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useCallback: ('f, 'deps) => 'f = "useCallback"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useCallback0: ('f, @as(json`[]`) _) => 'f = "useCallback"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useCallback1: ('f, array<'a>) => 'f = "useCallback"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useCallback2: ('f, ('a, 'b)) => 'f = "useCallback"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useCallback3: ('f, ('a, 'b, 'c)) => 'f = "useCallback"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useCallback4: ('f, ('a, 'b, 'c, 'd)) => 'f = "useCallback"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useCallback5: ('f, ('a, 'b, 'c, 'd, 'e)) => 'f = "useCallback"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useCallback6: ('callback, ('a, 'b, 'c, 'd, 'e, 'f)) => 'callback = "useCallback"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useCallback7: ('callback, ('a, 'b, 'c, 'd, 'e, 'f, 'g)) => 'callback = "useCallback"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useContext: Context.t<'any> => 'any = "useContext"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useRef: 'value => ref<'value> = "useRef"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useImperativeHandleOnEveryRender: (
  Js.Nullable.t<ref<'value>>,
  @uncurry (unit => 'value),
) => unit = "useImperativeHandle"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useImperativeHandle: (
  Js.Nullable.t<ref<'value>>,
  @uncurry (unit => 'value),
  'deps,
) => unit = "useImperativeHandle"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useImperativeHandle0: (
  Js.Nullable.t<ref<'value>>,
  @uncurry (unit => 'value),
  @as(json`[]`) _,
) => unit = "useImperativeHandle"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useImperativeHandle1: (
  Js.Nullable.t<ref<'value>>,
  @uncurry (unit => 'value),
  array<'a>,
) => unit = "useImperativeHandle"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useImperativeHandle2: (
  Js.Nullable.t<ref<'value>>,
  @uncurry (unit => 'value),
  ('a, 'b),
) => unit = "useImperativeHandle"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useImperativeHandle3: (
  Js.Nullable.t<ref<'value>>,
  @uncurry (unit => 'value),
  ('a, 'b, 'c),
) => unit = "useImperativeHandle"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useImperativeHandle4: (
  Js.Nullable.t<ref<'value>>,
  @uncurry (unit => 'value),
  ('a, 'b, 'c, 'd),
) => unit = "useImperativeHandle"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useImperativeHandle5: (
  Js.Nullable.t<ref<'value>>,
  @uncurry (unit => 'value),
  ('a, 'b, 'c, 'd, 'e),
) => unit = "useImperativeHandle"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useImperativeHandle6: (
  Js.Nullable.t<ref<'value>>,
  @uncurry (unit => 'value),
  ('a, 'b, 'c, 'd, 'e, 'f),
) => unit = "useImperativeHandle"

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useImperativeHandle7: (
  Js.Nullable.t<ref<'value>>,
  @uncurry (unit => 'value),
  ('a, 'b, 'c, 'd, 'e, 'f, 'g),
) => unit = "useImperativeHandle"

module Uncurried = {
  @module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external useState: (@uncurry (unit => 'state)) => ('state, (. 'state => 'state) => unit) =
    "useState"

  @module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external useReducer: (
    @uncurry ('state, 'action) => 'state,
    'state,
  ) => ('state, (. 'action) => unit) = "useReducer"

  @module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external useReducerWithMapState: (
    @uncurry ('state, 'action) => 'state,
    'initialState,
    @uncurry ('initialState => 'state),
  ) => ('state, (. 'action) => unit) = "useReducer"

  @module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external useCallback: ('f, 'deps) => 'f = "useCallback"

  @module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external useCallback0: ('f, @as(json`[]`) _) => 'f = "useCallback"

  @module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external useCallback1: ('f, array<'a>) => 'f = "useCallback"

  @module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external useCallback2: ('f, ('a, 'b)) => 'f = "useCallback"

  @module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external useCallback3: ('f, ('a, 'b, 'c)) => 'f = "useCallback"

  @module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external useCallback4: ('f, ('a, 'b, 'c, 'd)) => 'f = "useCallback"

  @module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external useCallback5: ('f, ('a, 'b, 'c, 'd, 'e)) => 'f = "useCallback"

  @module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external useCallback6: ('callback, ('a, 'b, 'c, 'd, 'e, 'f)) => 'callback = "useCallback"

  @module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
  external useCallback7: ('callback, ('a, 'b, 'c, 'd, 'e, 'f, 'g)) => 'callback = "useCallback"
}

@module("react") @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external useTransition: unit => (bool, (. unit => unit) => unit) = "useTransition"

@set @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external setDisplayName: (component<'props>, string) => unit = "displayName"

@get @return(nullable) @deprecated("Jsx 3 is deprecated, use jsx 4 instead")
external displayName: component<'props> => option<string> = "displayName"
