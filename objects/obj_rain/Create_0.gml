// obj_rain → Create Event
part_sys = part_system_create();
part_system_depth(part_sys, -100); // On top of background, behind player/UI

rain_particle = part_type_create();
part_type_shape(rain_particle, pt_shape_square); // Keeps the streak look

// Make thinner and shorter rain lines
part_type_size(rain_particle, 0.05, 0.15, 0, 0);

// Tint it light blue or white, adjust to match your style
part_type_color1(rain_particle, make_color_rgb(20, 20, 255)); 
part_type_alpha2(rain_particle, 0.5, 0); // Fades out smoothly

// Speed and gravity
part_type_speed(rain_particle, 12, 17, 0, 0); // Faster rain
part_type_direction(rain_particle, 265, 275, 0, 0); // More vertical
part_type_gravity(rain_particle, 0.3, 270); // Optional: adds more drop arc

// Shorter lifespan = less lingering rain
part_type_life(rain_particle, 30, 50);

// Emitter setup
emitter = part_emitter_create(part_sys);
part_emitter_region(part_sys, emitter, 0, room_width, 0, 0, ps_shape_line, ps_distr_linear);
