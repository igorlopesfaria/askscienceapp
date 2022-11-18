class DSIconProps {

  DSIconProps({
    required this.icon,
    this.size
  });

  final DSIcons icon;
  final DSIconSize? size;
}

enum DSIconSize {
  sm,
  md;
}

enum DSIcons {
  alertTriangle(name: 'ic_alert_triangle'),
  await(name: 'ic_await'),
  dragHandle(name: 'ic_drag_handle'),
  checkCircle(name: 'ic_check_circle'),
  chevronLeftPrimary(name: 'ic_chevron_left_primary'),
  close(name: 'ic_close'),
  closeOctagon(name: 'ic_close_octagon'),
  email(name: 'ic_email'),
  empty(name: 'ic_empty'),
  error(name: 'ic_error'),
  info(name: 'ic_info'),
  information(name: 'ic_information'),
  reload(name: 'ic_reload'),
  success(name: 'ic_success'),
  warning(name: 'ic_warning');

  const DSIcons({
    required this.name
  });

  final String name;
}


