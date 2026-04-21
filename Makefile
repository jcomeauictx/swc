TESTJS := crates/swc_ecma_minifier/tests/benches-full/echarts.js
default: test
target/debug/swc: Makefile
	cargo build  # build debug version
	cargo build --release -p swc_cli  # release package
$(HOME)/.cargo/bin/swc: target/debug/swc Makefile | $(HOME)/.cargo/bin
	cargo install --path bindings/swc_cli || cp -f $< $@
test: $(HOME)/.cargo/bin/swc $(TESTJS) Makefile
	cat $(TESTJS) | $< compile --config-file es3.swcrc | head
$(HOME)/.cargo/bin:
	mkdir -p $@
