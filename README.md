# FlashLayout
FlashLayout wraps the system apis to make it easy to create or active `NSLayoutContraint`

# Install
`pod 'FlashLayout'`

# Swift Package Manager
Copy URL https://github.com/felix8888/FlashLayout as the Package URL

# Use VFL for a single statement
Call the `addConstraints` to add and create constraints

Sample code
```
view.addConstraints("|[view]|", views: ["view": view])
```
Provde options
```
let views: [String: UIViiew] = [
    "leftView": leftView,
    "rightView": rightView,
]
view.addConstraints("|[leftView][rightView]|", options: [.alignAllTop, .alignAllBottom], views: views)

```
Same, you can add `metrics` parameter, it's default to `nil`

# Use function builder
This simplified all kinds of ways to generate constraints

Sample
```
NSLayoutConstraint.activate(views: ["c": c, "d": d, "d": d]) {
    a.leftAnchor.constraint(equalTo: b.leftAnchor)
    "H:|[c][d]|".options(.alignAllTop)
    "V:|[c]|"
    d.flHeight <= c.flHeight * 0.5 + 100
    d.flWidth == 100
    existingConstraintsArray
}
```

If you only want to create constraints and won't active them directly, call this func
```
let constraints = NSLayoutConstraint.constraints(views: ["c": c, "d": d]) {
    a.leftAnchor.constraint(equalTo: b.leftAnchor)
    "H:|[c][d]|".options(.alignAllTop)
    "V:|[c]|"
    existingConstraintsArray
}
```

Note: FlashLayout provide some shorter names for LayoutAnchor, such as `view.flWidth` is `view.widthAnchor`
If you don't like them, you could use the original name too

FlashLayout defines some math operators for constration creation, so the 3 lines below are same
```
a.flLeft == b.flCenterX + 100
a.leftAnchor == b.centerXAnchor + 100
a.leftAnchor.constraint(equalTo: b.centerXAnchor, constant: 100)
```

# Available layout anchor math operators
> - `==` equal to
> - `<=` less than or equal to
> - `>=` greater than or equal to
> - `*`  multiplier
> - `+`  additional constant

