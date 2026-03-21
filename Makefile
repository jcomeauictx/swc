TESTJS := crates/swc_ecma_minifier/tests/benches-full/echarts.js
default: test
target/debug/swc:
	cargo build
$(HOME)/.local/bin/swc: target/debug/swc | $(HOME)/.local/bin
	cargo install
test: $(HOME)/.local/bin/swc $(TESTJS)
	cat $(TESTJS) | $<
$(HOME)/.local/bin:
	mkdir -p $@
