use leptos::*;
mod webgl;

fn main() {
    console_error_panic_hook::set_once();

    mount_to_body(|| {
        view! {
            <canvas id="canvas" width="640" height="480"></canvas>
            <App/>
        }
    })
}

#[component]
pub fn App() -> impl IntoView {
    let (count, set_count) = create_signal(0.0);
    let (vertices, set_vertices) = create_signal([-0.7, -0.7, 0.0, 0.7, -0.7, 0.0, 0.0, 0.7, 0.0]);

    create_effect(move |_| {
        let context = webgl::init_webgl().unwrap();

        webgl::draw(&context, vertices.get()).unwrap();
    });

    view! {
        <button on:click={move |_| {
            set_count(count.get() + 0.1);
            set_vertices([
                -0.7 + count.get(), -0.7, 0.0,
                0.7, -0.7, 0.0,
                0.0, 0.7, 0.0
            ]);
        }}>{"Draw"}</button>
    }
}
