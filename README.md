# MPL

MPL is a post-install script for Ubuntu and Pop_OS! that installs multiple packages and tools for development and daily use. It focuses on providing modern and standard tools which are not included in the default installation of Ubuntu and Pop_OS!.

The script installs the following tools:
- Git
- Curl
- Docker and Docker Compose. It configures Docker to run without sudo.
- Podman and Podman Compose.
- Brave Browser to provide a chromium based browser. It keeps Firefox as default browser.
- Rust
- Distrobox
- Pika Backups
- NVM - Node Version Manager

For the command line, it installs the following commands and creates alias for common commands:
- (ls) eza - A modern alternative to ls
- Oh My Posh - A prompt theme. Set up the amro theme by default.
- (cd) zoxide - A faster way to navigate your filesystem
- fzf - A command-line fuzzy finder
- (cat) Bat - A cat clone with wings
- (find) fd - A simple, fast and user-friendly alternative to find
- (top) bottom - A cross-platform graphical process/system monitor with a customizable interface and a multitude of features.
- (ps) procs - A modern replacement for ps written in Rust
- (man, tldr) tealdeer - A very fast implementation of tldr in Rust, a community effort to simplify man pages with practical examples.
- Atuin - Sync, search and backup shell history with Atuin
