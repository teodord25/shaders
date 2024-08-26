pub async fn run() {
    #[cfg_attr(target_arch = "wasm32", allow(unused_variables))]
    let adapter = {
        let instance = wgpu::Instance::default();
        instance
            .request_adapter(&wgpu::RequestAdapterOptions::default())
            .await
            .unwrap()
    };

    log::info!("Selected adapter: {:?}", adapter.get_info())
}
