.PHONY: all
all: web/main.wasm

%.wasm: %.dart lib/*
	dart compile wasm $<

.PHONY: fmt
fmt:
	deno fmt

.PHONY: serve
serve:
	python3 -m http.server -d web
