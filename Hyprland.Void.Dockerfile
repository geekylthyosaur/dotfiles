FROM voidlinux/voidlinux:latest

RUN xbps-install -Suy
RUN xbps-install -uy xbps
RUN xbps-install -Suy xmirror
RUN xbps-install -y jq pkg-config
RUN xmirror -s https://void.sakamoto.pl/
RUN xbps-install -y git gdb ninja gcc cmake meson libxcb-devel xcb-proto xcb-util-devel xcb-util-keysyms-devel xcb-util-errors-devel xcb-util-renderutil-devel libXfixes-devel libX11-devel libXcomposite-devel xinput libXrender-devel pixman-devel wayland-devel wayland-protocols cairo-devel pango-devel libseat-devel libxkbcommon-devel xcb-util-wm-devel xorg-server-xwayland libinput-devel Vulkan-Headers glslang-devel ffmpeg-devel
RUN git clone --recursive https://github.com/hyprwm/Hyprland
RUN cd Hyprland
RUN meson _build
RUN ninja -C _build
