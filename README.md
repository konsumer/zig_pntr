This is a simple zig-wrapper around [pntr](https://github.com/robloach/pntr). You can use this to draw on images, or even use it to make graphics in a game.

## example

```zig
const pntr = @import("pntr");

pub fn main() void {
    const image = pntr.new_image(200, 200);
    defer pntr.unload_image(image);

    pntr.draw_circle_fill(image, 100, 100, 80, pntr.RED);
    pntr.save_image(image, "output.png");
}
```

I have more examples in unit-tests at bottom of [pntr.zig](src/pntr.zig).


## api

The API is all the same, except `pntr_` is removed (because things are namespaced to lib) so refer to [pntr](https://github.com/robloach/pntr?tab=readme-ov-file#functions). I tried to keep all the function-names identical, even if it felt less idiomatic in zig.


## usage

Add to your project like this:

```
zig fetch --save git+https://github.com/konsumer/zig_pntr#main
```

Then in your `build.zig`:

```zig
const pntr_dep = b.dependency("pntr", .{
    .target = target,
    .optimize = optimize
});
const pntr = pntr_dep.module("pntr");
```

Now add to your own exe targtet like this:

```zig
exe.root_module.addImport("pntr", pntr);
```


## development

I am new to zig, so I'm keeping notes on how to do basic stuff here.

```bash
# get info about about building
zig build --help

# build the library
zig build

# run unit-tests
zig build test
```
