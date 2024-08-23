use leptos::*;
mod webgl;

fn main() {
    console_error_panic_hook::set_once();

    mount_to_body(|| view! { <App/> })
}

#[component]
pub fn App() -> impl IntoView {
    let (count, set_count) = create_signal(0);

    let vertices: [f32; 9] = [1.0, -0.7, 0.0, 0.7, -0.7, 0.0, 0.0, 0.7, 0.0];

    create_effect(move |_| { 
        let context = webgl::init_webgl().unwrap();
        webgl::draw(&context, vertices).unwrap();
    });

    view! {
        <button on:click={move |_| {
            set_count(count.get() + 1);
        }}></button>
        <canvas id="canvas" width="640" height="480"></canvas>
    }
}
