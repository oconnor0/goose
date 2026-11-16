// Fullscreen and display scale without a window, before opening and headless.
import std;
import os;
import gfx;

fn check_window_controls() {
    assert(!gfx::set_fullscreen(true));
    assert(!gfx::set_fullscreen(false));
    assert(!gfx::fullscreen());
    gfx::maximize();
    assert(gfx::pixel_density() == 1.0);
    assert(gfx::display_scale() == 1.0);
}

fn main() {
    check_window_controls();
    guard gfx::open_headless(32, 24) else {
        write_stderr(str("gfx: ", gfx::error(), "\n"));
        return;
    }
    check_window_controls();
    gfx::close();
    print("window controls without a window: ok");
}
