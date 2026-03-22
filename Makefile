default: $(HOME)/.cargo/bin/swc
target/debug/swc: Makefile
	cargo build
$(HOME)/.cargo/bin/swc: target/debug/swc
	cargo install || cp -f $< $@
