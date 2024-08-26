use winit::{
    event::*,
    event_loop::EventLoop,
    keyboard::{KeyCode, PhysicalKey},
    window::WindowBuilder,
};

pub fn run() {
    env_logger::init();
    let event_loop = EventLoop::new().unwrap();
    let window = WindowBuilder::new().build(&event_loop).unwrap();

    let _ = event_loop.run(move |event, control_flow| match event {
        // pattern match window events, and check if the window ids match
        Event::WindowEvent {
            ref event,
            window_id,
        } if window_id == window.id() => match event {
            // inner pattern match on specific window events
            WindowEvent::CloseRequested
            | WindowEvent::KeyboardInput {
                event:
                    KeyEvent {
                        state: ElementState::Pressed,
                        physical_key: PhysicalKey::Code(KeyCode::Escape),
                        ..
                    },
                ..
            } => control_flow.exit(),
            _ => {
                println!("{:?}", event);
                // all window events that are not CloseRequested or the
                // specific keyboard input event end up here
            }
        },
        // all non window events end up here
        _ => {}
    });
}

fn main() {
    run();
}
