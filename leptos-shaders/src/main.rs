use leptos::*;
mod webgl;

fn main() {
    console_error_panic_hook::set_once();

    mount_to_body(|| view! { <App/> })
}

#[component]
pub fn App() -> impl IntoView {
    let (toggled, set_toggled) = create_signal(false);

    create_effect(|_| { webgl::init_webgl().unwrap() });

    // share `set_toggled` with all children of this component
    provide_context(set_toggled);

    view! {
        <p>"hello bros" {toggled}</p>
        <canvas id="canvas" width="640" height="480"></canvas>
    }
}
