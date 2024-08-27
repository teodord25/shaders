pub mod app;
pub mod webgpu;

use app::App;
use leptos::*;

use webgpu::state::run;

fn main() {
    std::panic::set_hook(Box::new(console_error_panic_hook::hook));
    console_log::init().expect("could not initialize logger");

    mount_to_body(App);
    spawn_local(run());
}
