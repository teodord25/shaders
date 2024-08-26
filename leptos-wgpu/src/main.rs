use leptos::*;
mod wgpu;

use wgpu::run;

fn main() {
    console_error_panic_hook::set_once();

    std::panic::set_hook(Box::new(console_error_panic_hook::hook));
    console_log::init().expect("could not initialize logger");
    wasm_bindgen_futures::spawn_local(run());

    leptos::mount_to_body(|| view! { <App/> })
}

#[component]
fn App() -> impl IntoView {
    let (count, set_count) = create_signal(0);

    view! {
        <button
            on:click=move |_| {
                set_count.set(3);
            }
        >
            "Click me: "
            {move || count.get()}
        </button>
    }
}
