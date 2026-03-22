TESTJS := crates/swc_ecma_minifier/tests/benches-full/echarts.js
default: test
target/debug/swc:
	cargo build
$(HOME)/.cargo/bin/swc: target/debug/swc | $(HOME)/.cargo/bin
	cargo install || cp -f $< $@
test: $(HOME)/.cargo/bin/swc $(TESTJS)
	cat $(TESTJS) | $< compile
$(HOME)/.cargo/bin:
	mkdir -p $@
