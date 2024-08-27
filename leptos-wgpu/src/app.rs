use leptos::*;

use crate::webgpu::{
    app::GpuApplication,
    context::{GpuContext, GpuShaderConfig},
    instance::GpuInstance,
};

#[component]
pub fn App() -> impl IntoView {
    view! {
        <div>
            <h1>"Hello, World!"</h1>
        </div>
    }
}


use encase::ShaderType;

#[derive(ShaderType, Clone, Copy)]
pub struct AppState {
    pub color: glam::Vec4,
}

impl Default for AppState {
    fn default() -> Self {
        AppState {
            color: glam::Vec4::new(0.0, 1.0, 0.0, 1.0),
        }
    }
}

impl AppState {}

impl GpuApplication for AppState {
    fn build(self, resources: GpuInstance) -> GpuContext {
        GpuContext::new::<AppState>(
            resources,
            GpuShaderConfig {
                src: include_str!("shader.wgsl"),
                vertex_entry: "vs_main",
                fragment_entry: "fs_main",
            },
        )
    }
}


use std::sync::Arc;

#[allow(non_snake_case)]
#[component]
pub fn Triangle() -> impl IntoView {
    // ? create reference to DOM node
    let node = create_node_ref::<html::Div>();

    // ? use leptos signaling to encapsulate AppState
    let (app, _) = create_signal::<AppState>(Default::default());

    let container = move || <web_sys::HtmlDivElement as Clone>::clone(&node.get().unwrap());

    // ? use thread to handle gpu runtime
    spawn_local(async move {
        // ? read runtime instance from read signal
        let mut runtime = app.get();

        let (window, event_loop) = runtime.setup(container());

        runtime.render(Arc::new(window), event_loop).await;
    });

    view! {
        <div>
            <div node_ref=node/>
        </div>
    }
}
